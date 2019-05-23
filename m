From: cyphar@cyphar.com (Aleksa Sarai)
Date: Thu, 23 May 2019 12:00:09 +1000
Subject: [PATCH RFC v8 01/10] namei: obey trailing magic-link DAC
 permissions
In-Reply-To: <CALCETrVCwe49q5mu=f6jTYNSgosQSjjY5chukMPo6eZtQGqo5g@mail.gmail.com>
References: <20190520133305.11925-1-cyphar@cyphar.com>
 <20190520133305.11925-2-cyphar@cyphar.com>
 <CALCETrVCwe49q5mu=f6jTYNSgosQSjjY5chukMPo6eZtQGqo5g@mail.gmail.com>
Message-ID: <20190523020009.mi25uziu2b3whf4l@yavin>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523020009.onEinqB_p3BsC_IYYIyh3zFfigvlSxU2N_6skqZInJ0@z>

On 2019-05-22, Andy Lutomirski <luto@kernel.org> wrote:
> On Mon, May 20, 2019@6:34 AM Aleksa Sarai <cyphar@cyphar.com> wrote:
> > One final exception is given, which is that non-O_PATH file descriptors
> > are given re-open rights equivalent to the permissions available at
> > open-time. This allows for O_RDONLY file descriptors to be re-opened
> > O_RDWR as long as the user had MAY_WRITE access at the time of opening
> > the O_RDONLY descriptor. This is necessary to avoid breaking userspace
> > (some of the kernel's own selftests depended on this "feature").
> 
> Can you clarify this exception a bit?  I'd like to make sure it's not
> such a huge exception that it invalidates the whole point of the
> patch.

Sure. This exception applies to regular file opens, and the idea is that
the user had permissions to open the file O_RDWR originally (even if
they opened it O_RDONLY) so re-opening it O_RDWR later should not be an
issue (they could've just opened it O_RDWR in the first place). These
permissions still get masked by nd->opath_mask, so opening a magic-link
or including an O_PATH doesn't increase the permission set.

This does mean that an O_RDONLY open (if the user could've done an
O_RDWR and still done the open) results in an FMODE_PATH_WRITE. To be
honest, I'm still on the fence whether this is a great idea or not (and
I'd prefer to not include it). Though, I don't think it invalidates the
patch though, since the attack scenario of a read-only file being
re-opened later as read-write is still blocked.

The main reason for including it is the concern that there is some
program from 1993 running in a basement somewhere that depends on this
that we don't know about. Though, as a counter-example, I have run this
patchset (without this exception) on my laptop for a few days without
any visible issues.

> If you open a file for execute, by actually exec()ing it or by using
> something like the proposed O_MAYEXEC, and you have inode_permission
> to write, do you still end up with FMODE_PATH_WRITE? The code looks
> like it does, and this seems like it might be a mistake.

I'm not sure about the execve(2) example -- after all, you don't get an
fd from execve(2) and /proc/self/exe still has a mode a+rx.

I'm also not sure what the semantics of a hypothetical O_MAYEXEC would
be -- but we'd probably want to discuss re-opening semantics when it
gets included. I would argue that since O_MAYEXEC would likely be merged
after this, no userspace code would depend on this mis-feature and we
could decide to not include FMODE_EXECv2 in the handling of additional
permissions.

As an aside, I did originally implement RESOLVE_UPGRADE_NOEXEC (and the
corresponding FMODE_PATH_EXEC handling). It worked for the most part,
though execveat(AT_EMPTY_PATH) would need some additional changes to do
the may_open_magiclink() checks and I decided against including it here
until we had an O_MAYEXEC.

> Is there any way for user code to read out these new file mode bits?

There is, but it's not exactly trivial. You could check the mode of
/proc/self/fd and then compare it to the acc_mode of the "flags"
/proc/self/fdinfo. The bits present in /proc/self/fd but not in acc_mode
are the FMODE_PATH_* bits.

However, this is quite an ugly way of doing it. I see two options to
make it easier:

 1. We can add additional information to fdinfo so it includes that
    FMODE_PATH_* bits to indicate how the fd can be upgraded.

 2. Previously, only the u bits of the fd mode were used to represent the
    open flags. We could add the FMODE_PATH_* permissions to the g bits
    and change how the permission check in trailing_symlink() operates.

    The really neat thing here is that we could then know for sure which
    fmode bits are set during name lookup of a magic-link rather than
    assuming they're all FMODE_PATH_* bits.

    In addition, userspace that depends on checking the u bits of an fd
    mode would continue to work (though I'm not aware of any userspace
    code that does depend on this).

Option 2 seems nicer to me in some respects, but it has the additional
cost of making the permission check less obvious (it's no longer an
"inode_permission" and is instead something different with a weird new
set of semantics). Then again, the modes of magic-links weren't obeyed
in the first place so I'd argue these semantics are entirely up for us
to decide.

> What are actual examples of uses for this exception?  Breaking
> selftests is not, in and of itself, a huge problem.

Not as far as I know. All of the re-opening users I know of do re-opens
of O_PATH or are re-opening with the same (or fewer) privileges. I also
ran this for a few days on my laptop without this exception, and didn't
have any visible issues.

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190523/b14c0f0c/attachment.sig>

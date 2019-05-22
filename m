From: luto@kernel.org (Andy Lutomirski)
Date: Wed, 22 May 2019 10:01:17 -0700
Subject: [PATCH RFC v8 01/10] namei: obey trailing magic-link DAC
 permissions
In-Reply-To: <20190520133305.11925-2-cyphar@cyphar.com>
References: <20190520133305.11925-1-cyphar@cyphar.com>
 <20190520133305.11925-2-cyphar@cyphar.com>
Message-ID:
 <CALCETrVCwe49q5mu=f6jTYNSgosQSjjY5chukMPo6eZtQGqo5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522170117.OcmoxIJJZbdnXe6aL2LCKjO-2EllwZGz9eXkLI_mN1c@z>

On Mon, May 20, 2019@6:34 AM Aleksa Sarai <cyphar@cyphar.com> wrote:
> One final exception is given, which is that non-O_PATH file descriptors
> are given re-open rights equivalent to the permissions available at
> open-time. This allows for O_RDONLY file descriptors to be re-opened
> O_RDWR as long as the user had MAY_WRITE access at the time of opening
> the O_RDONLY descriptor. This is necessary to avoid breaking userspace
> (some of the kernel's own selftests depended on this "feature").

Can you clarify this exception a bit?  I'd like to make sure it's not
such a huge exception that it invalidates the whole point of the
patch.  If you open a file for execute, by actually exec()ing it or by
using something like the proposed O_MAYEXEC, and you have
inode_permission to write, do you still end up with FMODE_PATH_WRITE?
The code looks like it does, and this seems like it might be a
mistake.  Is there any way for user code to read out these new file
mode bits?

What are actual examples of uses for this exception?  Breaking
selftests is not, in and of itself, a huge problem.

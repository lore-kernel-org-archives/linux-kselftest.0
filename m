From: cyphar at cyphar.com (Aleksa Sarai)
Date: Fri, 24 May 2019 13:11:09 +1000
Subject: [PATCH RFC v8 01/10] namei: obey trailing magic-link DAC
 permissions
In-Reply-To: <20190523020009.mi25uziu2b3whf4l@yavin>
References: <20190520133305.11925-1-cyphar@cyphar.com>
 <20190520133305.11925-2-cyphar@cyphar.com>
 <CALCETrVCwe49q5mu=f6jTYNSgosQSjjY5chukMPo6eZtQGqo5g@mail.gmail.com>
 <20190523020009.mi25uziu2b3whf4l@yavin>
Message-ID: <20190524031109.v24r6typyug2rlto@yavin>

On 2019-05-23, Aleksa Sarai <cyphar at cyphar.com> wrote:
> On 2019-05-22, Andy Lutomirski <luto at kernel.org> wrote:
> > What are actual examples of uses for this exception?  Breaking
> > selftests is not, in and of itself, a huge problem.
> 
> Not as far as I know. All of the re-opening users I know of do re-opens
> of O_PATH or are re-opening with the same (or fewer) privileges. I also
> ran this for a few days on my laptop without this exception, and didn't
> have any visible issues.

I have modified the patch to WARN_ON(may_open_magiclink() == -EACCES).

So far (in the past day on my openSUSE machines) I have only seen two
programs which have hit this case: kbd[1]'s "loadkeys" and "kbd_mode"
binaries. In addition to there not being any user-visible errors -- they
actually handle permission errors gracefully!

  static int
  open_a_console(const char *fnam)
  {
  	int fd;

  	/*
  	 * For ioctl purposes we only need some fd and permissions
  	 * do not matter. But setfont:activatemap() does a write.
  	 */
  	fd = open(fnam, O_RDWR);
  	if (fd < 0)
  		fd = open(fnam, O_WRONLY);
  	if (fd < 0)
  		fd = open(fnam, O_RDONLY);
  	if (fd < 0)
  		return -1;
  	return fd;
  }

The above gets called with "/proc/self/fd/0" as an argument (as well as
other console candidates like "/dev/console"). And setfont:activatemap()
actually does handle read-only fds:

  static void
  send_escseq(int fd, const char *seq, int n)
  {
  	if (write(fd, seq, n) != n) /* maybe fd is read-only */
  		printf("%s", seq);
  }

  void activatemap(int fd)
  {
  	send_escseq(fd, "\033(K", 3);
  }

So, thus far, not only have I not seen anything go wrong -- the only
program which actually hits this case handles the error gracefully.
Obviously we got lucky here, but the lack of any users of this
mis-feature leads me to have some hope that we can block it without
anyone noticing.

But I emphatically do not want to break userspace here (except for
attackers, obviously).

[1]: http://git.altlinux.org/people/legion/packages/kbd.git

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190524/29603a4f/attachment.sig>

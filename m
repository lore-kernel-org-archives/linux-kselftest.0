From: luto at kernel.org (Andy Lutomirski)
Date: Tue, 26 Jun 2018 22:13:26 -0700
Subject: test_syscall_vdso_32 [FAIL]
In-Reply-To: <45ea6606-e782-fd07-fffa-cc133b33f9f7@intel.com>
References: <0d78b5b4-710e-1b41-46e1-74003ca1381e@intel.com>
 <CALCETrVLRmySnqpG+o-S9VGkx7uKFfLGeawyM7UDCRj_g7vs1g@mail.gmail.com>
 <45ea6606-e782-fd07-fffa-cc133b33f9f7@intel.com>
Message-ID: <CALCETrVc5f9VMQtZ-_GeGzhmttXnFMjipK6ER59Q0LbY076N+w@mail.gmail.com>

On Mon, Jun 25, 2018 at 6:23 PM Li Zhijian <zhijianx.li at intel.com> wrote:
>
> On 6/25/2018 11:40 PM, Andy Lutomirski wrote:
> > On Mon, Jun 25, 2018 at 1:41 AM Li Zhijian <zhijianx.li at intel.com> wrote:
> >> Hi
> >>
> >> Intel 0Day noticed that test_syscall_vdso_32 failed since 8bb2610bc4967f19672444a7b0407367f1540028(x86/entry/64/compat: Preserve r8-r11 in int $0x80)
> >>

[snipped]

Indeed.

Hi Thomas-

Something went wrong when you applied the patch mentioned above.  The
original patch is here:

https://lore.kernel.org/lkml/d4c4d9985fbe64f8c9e19291886453914b48caee.1523975710.git.luto at kernel.org/

but somehow it got applied with huge offset -- the same exact change
was made, but it was made to the entirely wrong function!  I'm a
little nervous about sending a fixup patch because there are three
copies of that code in the file, and I don't want to just move the
problem around.  What's the right thing to do here?

Clearly this needs to get fixed somehow, and the fix should go to -stable.

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

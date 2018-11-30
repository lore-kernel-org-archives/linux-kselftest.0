From: liuwl.fnst@cn.fujitsu.com (Liu, Wenlong)
Date: Fri, 30 Nov 2018 03:09:02 +0000
Subject: seccomp/seccomp_bpf: test terminated by the not expected behavior
In-Reply-To: <CAGXu5j+B_+UggW50bFVuZKM2Fsou7g6ZMrCL_kPHyc7tsWFDSA@mail.gmail.com>
References: <F40213214988A94A9DDBFC5F7146FC5E01AF2E2998@G08CNEXMBPEKD01.g08.fujitsu.local>
 <CAGXu5j+B_+UggW50bFVuZKM2Fsou7g6ZMrCL_kPHyc7tsWFDSA@mail.gmail.com>
Message-ID:
 <F40213214988A94A9DDBFC5F7146FC5E01AF2E29AC@G08CNEXMBPEKD01.g08.fujitsu.local>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181130030902.pCn-kmlW4BGPopWDO2lI0fsvVc9MaTM3Kf7u9mIU1CM@z>

> -----Original Message-----
> From: Kees Cook [mailto:keescook at chromium.org]
> Sent: Friday, November 30, 2018 10:58 AM
> To: Liu, Wenlong/刘 文龙 <liuwl.fnst at cn.fujitsu.com>
> Cc: Andy Lutomirski <luto at amacapital.net>; Will Drewry
> <wad at chromium.org>; Shuah Khan <shuah at kernel.org>; open list:KERNEL
> SELFTEST FRAMEWORK <linux-kselftest at vger.kernel.org>;
> yuichi.kusakabe at denso-ten.com; kisuke.kawamura at denso-ten.com
> Subject: Re: seccomp/seccomp_bpf: test terminated by the not expected
> behavior
> > ---
> > Although I am not so familiar with SECCOMP and BPF, I checked some related
> documents and codes.
> > About the failures above, what the most confused me is that why it always
> give ENOSYS.
> >
> > Am I missing something?
> > Thanks in advance.
> >
> > PS:
> > I didn't run "make kselftest-merge" before compiling the kernel that I'm
> using.
> >
> > ---
> > The Test Environment:
> > - Kernel version: v4.14.0
> 
> Hi!
> 
> It appears you're attempting to use a newer seccomp selftest on an older
> kernel. That isn't a supported way to test seccomp. You'll need to build
> 4.14's seccomp_bpf test binary and run it instead.

Thanks for your reply.

Indeed, there is little difference between the version of kernel and kselftest.

Someone(or doc) tells me that,
If you run a kernel xyz, then always run the BPF kernel selftests from that kernel xyz as well. 
Do not expect that the BPF selftest from the latest mainline tree will pass all the time.

But I forget that, the little difference in my case is different "z". :-)  My fault.

Thanks again.

Best regards
Liu

> --
> Kees Cook
> 

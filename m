From: rostedt@goodmis.org (Steven Rostedt)
Date: Sun, 3 Dec 2017 16:22:56 -0500
Subject: [Linux-kselftest-mirror] Difficulties for compilation without
	extra optimisation
In-Reply-To: <1512314250.3673.6.camel@primarydata.com>
References: <7f072f78-eef4-6d87-d233-cee71dac5a32@users.sourceforge.net>
 <a2ac6d05-fdd6-82bb-075e-b7eb81b516fe@users.sourceforge.net>
 <1512314250.3673.6.camel@primarydata.com>
Message-ID: <20171203162256.4ea0750d@vmware.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171203212256.0_zF63ZWD_UQmaanKF5tCal77PZ2fc_iL7fTRM5WUf8@z>

On Sun, 3 Dec 2017 15:17:32 +0000
Trond Myklebust <trondmy@primarydata.com> wrote:

> > I would like to check corresponding build results then without extra
> > optimisation applied by the compiler.
> > But I got surprised by error messages for a command like the
> > following.
> > 
> > elfring at Sonne:~/Projekte/Linux/next-patched> my_cc=/usr/bin/gcc-7 &&
> > LANG=C make -j4 CC="${my_cc}" HOSTCC="${my_cc}" EXTRA_CFLAGS='-O0'
> > allmodconfig fs/nfs/write.o

Why would you compile the kernel without optimization? There's many
places in the kernel that WILL NOT BUILD without optimization. In fact,
we do a lot of tricks to make sure that things work the way we expect
it to, because we add broken code that only gets compiled out when gcc
optimizes the code the way we expect it to be, and the kernel build
will break otherwise.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

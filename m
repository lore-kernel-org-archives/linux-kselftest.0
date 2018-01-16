From: bp@alien8.de (Borislav Petkov)
Date: Tue, 16 Jan 2018 12:44:28 +0100
Subject: [Linux-kselftest-mirror] selftests: run all tests
In-Reply-To: <87tvvmcp0u.fsf@concordia.ellerman.id.au>
References: <20180115145942.s3dgy457xwhn6lwv@pd.tnic>
 <87tvvmcp0u.fsf@concordia.ellerman.id.au>
Message-ID: <20180116114411.u4cqtvzw6evwnehu@pd.tnic>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180116114428.Bn6BEAB848ZeH7k2KaC3ODom-oeiXGM1zbNf6SwORfI@z>

On Tue, Jan 16, 2018@05:10:25PM +1100, Michael Ellerman wrote:
> $ cd tools/testing/selftests/x86
> $ make run_tests
> 
> Should work?

Ah, that was hidden in the included lib.mk, thanks.

I wonder if we should make it more user-friendly by adding a help target
like for the main Makefile...

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

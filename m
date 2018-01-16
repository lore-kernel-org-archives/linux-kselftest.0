From: bp@alien8.de (Borislav Petkov)
Date: Tue, 16 Jan 2018 12:54:07 +0100
Subject: [Linux-kselftest-mirror] selftests: run all tests
In-Reply-To: <20180116114411.u4cqtvzw6evwnehu@pd.tnic>
References: <20180115145942.s3dgy457xwhn6lwv@pd.tnic>
 <87tvvmcp0u.fsf@concordia.ellerman.id.au>
 <20180116114411.u4cqtvzw6evwnehu@pd.tnic>
Message-ID: <20180116115407.xqlu6bfvqcwoxszg@pd.tnic>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180116115407.UZBDC8H7j7sRkAoAu-Ra9BmaMrpQgUTmrLN2eYVe2dM@z>

On Tue, Jan 16, 2018@12:44:28PM +0100, Borislav Petkov wrote:
> Ah, that was hidden in the included lib.mk, thanks.
> 
> I wonder if we should make it more user-friendly by adding a help target
> like for the main Makefile...

One more point:

What I do is copy the x86/ folder to a test box and run all tests there.
If the lib.mk is not copied, run_tests is missing....

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

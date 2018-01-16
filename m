From: mpe@ellerman.id.au (Michael Ellerman)
Date: Tue, 16 Jan 2018 17:10:25 +1100
Subject: [Linux-kselftest-mirror] selftests: run all tests
In-Reply-To: <20180115145942.s3dgy457xwhn6lwv@pd.tnic>
References: <20180115145942.s3dgy457xwhn6lwv@pd.tnic>
Message-ID: <87tvvmcp0u.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180116061025.9njVob3jLcG_jHIIS4sdsSzLUcnvI9VBR_BEhviViWA@z>

Borislav Petkov <bp at alien8.de> writes:

> Hi,
>
> do we want something like that with which one can run all selftests
> quickly?
>
> Or is there a way already which I couldn't find?

$ cd tools/testing/selftests/x86
$ make run_tests

Should work?

cheers
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

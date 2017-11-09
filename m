From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Thu, 9 Nov 2017 13:14:18 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: memfd_test.c: fix
	compilation warning.
In-Reply-To: <1509879400-26061-1-git-send-email-Lei.Yang@windriver.com>
References: <1509879400-26061-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <74202384-17c4-3111-3f71-63bf2997a2b1@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171109201418.Z5BsiLFjgj9nhVM_VCyQZSejMZ0IWXLhsAHmINS-VgA@z>

On 11/05/2017 03:56 AM, Lei Yang wrote:
> Replace '%d' by '%zu' to fix the following compilation warning.
> 
> memfd_test.c:517:3: warning: format ‘%d’ expects argument of
> type ‘int’,but argument 2 has type ‘size_t’ [-Wformat=]
>    printf("malloc(%d) failed: %m\n", mfd_def_size * 8);
>    ^
> memfd_test.c: In function ‘mfd_fail_grow_write’:
> memfd_test.c:537:3: warning: format ‘%d’ expects argument
> of type ‘int’,but argument 2 has type ‘size_t’ [-Wformat=]
>    printf("malloc(%d) failed: %m\n", mfd_def_size * 8);
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>

Thanks for the patch. Applied to linux-kselftest next for 4.15-rc1

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

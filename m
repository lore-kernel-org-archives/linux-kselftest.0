From: tom.hromatka at oracle.com (Tom Hromatka)
Date: Wed, 13 Jun 2018 11:18:11 -0600
Subject: [PATCH] selftests: sparc64: delete RUN_TESTS and EMIT_TESTS
 overrides
In-Reply-To: <20180612232403.28031-1-shuah@kernel.org>
References: <20180612232403.28031-1-shuah@kernel.org>
Message-ID: <8eb11b0a-3284-c580-6ae5-f0204ce5c5bf@oracle.com>

Thanks for the clean up, Shuah.  Looks good to me.

Tom



On 06/12/2018 05:24 PM, Shuah Khan (Samsung OSG) wrote:
> Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
> lib.mk. Common defines work just fine and there is no need to define
> custom overrides.
>
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

Reviewed-by: Tom Hromatka <tom.hromatka at oracle.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

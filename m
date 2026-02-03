Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21E3921F3
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106269; cv=pass; b=d0nw/xc6a6Oxhh2YxOTjCco9JFn+yACzfbd6incdupeyhBjH9SIIjY8erfyHwqd0SuZJikEVmbpk1gJ3acSRfmiO0hknTXzdjatRdrlE6WDGhJkTDvAkNE1CJ2ddHdmIdx0U4q7QUyHjy6EXscuhFNLe7GlOUqFdNKxD68zcKNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106269; c=relaxed/simple;
	bh=aCfNRHsM6ffXsuTLa8HXU7DZacvwG5p0LD0YeOWbSuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBsJXCyX/bjDfoI7EOaq5Lvk6JN1Ao7DcYS70x766mN0gIvmRM18WtsJ+7CB7GUwd/Ui/GX7HjcQmfksginH2/dujMa9LI2mUztMyrddaZ/L5/gI1fiY7L6xuc6Ho+MR17kj6a0nSyrr+CriwliU68pHG5L/0xR6ME25+AZ4aaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cYSsH3DB; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cYSsH3DB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc544b09so4896045f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 00:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770106265; cv=none;
        d=google.com; s=arc-20240605;
        b=KT01K7UZSCHGZxISJ/Eq1nw+yW8f1x9OioldZ16jX4Hi71VCOjGl4yotAQTnzIZpmg
         JxWesEG0hi3de/clQdSBEDTp6dkWLKH/WZCSVx+5TjN0wlo3t5PemDoIYi/ueLg47p/z
         BYz9qhPSem7VRdbetgWiLgjRn/hXra5IotQtI47n2EhgMrXRcT4aEY/C7AUPE/zIFXrE
         LEQthMSKnl3/kMtkbm/yWh27Fg6UtBL+88jVUg3RCklTvgvcjartxUNJ0+aYSPJhwCLa
         CinO3fClr3Ek4MRRooa8ub8Q9+2pxCkdbkOuD0jkC1IMjB4WIfrvP9OjwhRVdDc1abPv
         HMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=st3wwXB51lf/ZwFkYKw/wNRaUhqGXI2Oc792tzMQdeM=;
        fh=JJ19P7jt/234/ZiYsVPibfETEUcXgMbhRGb8ul1VO5o=;
        b=lgg4s2PjimgUub0s203h1U1mjB6R7KZB7YvUd6VZt0EkcoCX+zZfnN/4j0DBDVEXJJ
         L7FNfXibjb5TTj7a5KvhmeIpCiX4+kdmxdcAlWTHwp4EHB/AhbFwd421fXxnfxdQ2sfh
         Rj5LtC+PKIYTY1wF8y/brGTXCwJO7oLPw4GZ3XEYTN60RXu/G3y0ZLQE1COp+eKWuuJY
         SBe4tdQdV9Dpo1zeQnZmgSMPiUOsxgN4+/R/RY8yfWEr2HRWsza7SzIyOsu0khalNzi2
         8/odfPzNAuLWrredoFSHJDVnKSoWdkmQNy0HOELLyVsKSZaqeVfleJdFJrGtMWIBspbW
         agFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770106265; x=1770711065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=st3wwXB51lf/ZwFkYKw/wNRaUhqGXI2Oc792tzMQdeM=;
        b=cYSsH3DBTGGzGWdosrWITJOBSwfRNVRAbhYudaMgVgMR0DNJQtO4jr3lECxwdDCw9l
         NYaFjkKztLPHMuThFpu16dZS8qS4P/cqGLsLBqHqxNT/Esu6lyICgw/gxf+K/O9BAPxh
         k9r2EWPVRaaNAXng4843+XgobZ+fAq4fXtGWhRB47AeGk9R/gGMm8OMUJ/euuwQbdsm4
         I96776u/plEbvqRF7q4TTJvr6ps732ly78T5QQLczwAJiWTBCX0T+LpGSevkvDhPX4S6
         6u6nx6TJ6czBJi4m2MEf1j2I75W60AYh3h0xMTCj9etkwTSHZKn8xr3IQkKC5WCtJS8H
         Mn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106265; x=1770711065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st3wwXB51lf/ZwFkYKw/wNRaUhqGXI2Oc792tzMQdeM=;
        b=OMuyWEQr1yXb39aMPXJ2XadJN4ULelIHedxULKUbD9HPNEIITQLDdyOGEWCbQbsdrr
         AW0zI7MSVjfxQZs6pd1wXo987Ow7acTJutqRo8XTS24zIVWYd8RTmLkL06eyv8mijZ/2
         KmsnB6IDU51NccTA0U2ksYn0rzywClJZuh9obHrTLfRVWm4GjHg5DasuYYCAFitE6YaQ
         VGziXhVWNaxwcAcNo0OMyF1pyA1EfRyvXIV8lder4jAbI2T1dvpHS0L9OOqXnYRygJA4
         1eGLfHRjz7omQ8AVLNue2Cvr1Old4DMGipsp8X54ZAG7BkbByBCHmYWfFqxg9L43+Dhh
         31tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCwBK4oI6ztQd4+0tWP0J82wP91V/TBNt8qSA6KVmV3nrcVQmud66fe10p98reGhDV8ClOihP7gd+O8Pe2Gnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNF7eoraTiyY2eZmlzUVft7VJsfhYC1xP1Hvk27qaM6hRGQ74
	GYSnEi/ziaaYYhore34ZwMeweK3X3Xu6pIRxwSY79zBSTz8duKZ8rqYD+aQpEPdBXxoXDF5vmPS
	GBox3LD8yBxIXCST4FdQgtocG83pT7Ykp6JKyJiEt
X-Gm-Gg: AZuq6aJYa+IMWJBEtdysI1cEYk1tT3prmV/eZVnDFxz8ARCvp0Aogo9Sk16KVXRvLTX
	uRlJzJLyvHIHqEugtfnvRXQAASwdtqroQpbM75i2IR9v/+po9kLThjX/RjHFDADWSU7CAaQ7lUr
	b06nxBahKI2wT4WeWr65YzJZV4Z6eh6Vdw/+i/9mLt3jP3u9fILlxOAlZHAWBkB6yrwfsnphgqI
	UHdC7v30U1ZmY1Cx5RMmnCGoTAT06IwxbZgFmrjRE91VNwiqdyM9VQwQ999zVVboDVKqA==
X-Received: by 2002:a5d:5f54:0:b0:435:95c9:6895 with SMTP id
 ffacd0b85a97d-435f3a72dd1mr20705203f8f.18.1770106265218; Tue, 03 Feb 2026
 00:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202094903.1232201-1-arnd@kernel.org>
In-Reply-To: <20260202094903.1232201-1-arnd@kernel.org>
From: David Gow <davidgow@google.com>
Date: Tue, 3 Feb 2026 16:10:53 +0800
X-Gm-Features: AZwV_QgSvruq0ATLjxEt5fxUUSfgIMuI5KT4ORuN3hE_CVp2yj4rtPusluc7z_c
Message-ID: <CABVgOSk3jBJwPkL7VYzHbDxgQ20K+c9K=t9=Boq=5h6TOF-j5g@mail.gmail.com>
Subject: Re: [PATCH] [v2] kunit: reduce stack usage in kunit_run_tests()
To: Arnd Bergmann <arnd@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Carlos Llamas <cmllamas@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Marie Zhussupova <marievic@google.com>, Ujwal Jain <ujwaljain@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003156e60649e6fb69"

--0000000000003156e60649e6fb69
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Feb 2026 at 17:49, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Some of the recent changes to the kunit framework caused the stack usage
> for kunit_run_tests() to grow higher than most other kernel functions,
> which triggers a warning when CONFIG_FRAME_WARN is set to a relatively
> low value:
>
> lib/kunit/test.c: In function 'kunit_run_tests':
> lib/kunit/test.c:801:1: error: the frame size of 1312 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
>
> Split out the inner loop into a separate function to ensure that each
> function remains under the limit, and pass the kunit_result_stats
> structures by reference to avoid excessive copies.
>
> Cc: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2:
>  - plit out two functions instead of one, as there were still
>    stack size warnings with clang on the earlier version
>  - use void return type suggested by Carlos
>
> Carlos has successfully tested version 1, but after I rebased on
> current linux-next, the build warnings came back due to some other
> changes, and I had to rework the patch.
> ---

Thanks very much. I couldn't reproduce it here (kunit_run_tests uses
only 1104 bytes on my setup), but making it lower still and relying
less on the compiler "just happening" to optimise it enough is a good
thing.

There's one small checkpatch warning below, otherwise this looks good.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  lib/kunit/test.c | 230 +++++++++++++++++++++++++----------------------
>  1 file changed, 124 insertions(+), 106 deletions(-)
>
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 62eb529824c6..8668ed8d4553 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -94,7 +94,7 @@ struct kunit_result_stats {
>         unsigned long total;
>  };
>
> -static bool kunit_should_print_stats(struct kunit_result_stats stats)
> +static bool kunit_should_print_stats(struct kunit_result_stats *stats)
>  {
>         if (kunit_stats_enabled == 0)
>                 return false;
> @@ -102,11 +102,11 @@ static bool kunit_should_print_stats(struct kunit_result_stats stats)
>         if (kunit_stats_enabled == 2)
>                 return true;
>
> -       return (stats.total > 1);
> +       return (stats->total > 1);
>  }
>
>  static void kunit_print_test_stats(struct kunit *test,
> -                                  struct kunit_result_stats stats)
> +                                  struct kunit_result_stats *stats)
>  {
>         if (!kunit_should_print_stats(stats))
>                 return;
> @@ -115,10 +115,10 @@ static void kunit_print_test_stats(struct kunit *test,
>                   KUNIT_SUBTEST_INDENT
>                   "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
>                   test->name,
> -                 stats.passed,
> -                 stats.failed,
> -                 stats.skipped,
> -                 stats.total);
> +                 stats->passed,
> +                 stats->failed,
> +                 stats->skipped,
> +                 stats->total);
>  }
>
>  /* Append formatted message to log. */
> @@ -600,26 +600,26 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
>  }
>
>  static void kunit_print_suite_stats(struct kunit_suite *suite,
> -                                   struct kunit_result_stats suite_stats,
> -                                   struct kunit_result_stats param_stats)
> +                                   struct kunit_result_stats *suite_stats,
> +                                   struct kunit_result_stats *param_stats)
>  {
>         if (kunit_should_print_stats(suite_stats)) {
>                 kunit_log(KERN_INFO, suite,
>                           "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
>                           suite->name,
> -                         suite_stats.passed,
> -                         suite_stats.failed,
> -                         suite_stats.skipped,
> -                         suite_stats.total);
> +                         suite_stats->passed,
> +                         suite_stats->failed,
> +                         suite_stats->skipped,
> +                         suite_stats->total);
>         }
>
>         if (kunit_should_print_stats(param_stats)) {
>                 kunit_log(KERN_INFO, suite,
>                           "# Totals: pass:%lu fail:%lu skip:%lu total:%lu",
> -                         param_stats.passed,
> -                         param_stats.failed,
> -                         param_stats.skipped,
> -                         param_stats.total);
> +                         param_stats->passed,
> +                         param_stats->failed,
> +                         param_stats->skipped,
> +                         param_stats->total);
>         }
>  }
>
> @@ -681,13 +681,115 @@ static void kunit_init_parent_param_test(struct kunit_case *test_case, struct ku
>         }
>  }
>
> -int kunit_run_tests(struct kunit_suite *suite)
> +static noinline_for_stack void
> +kunit_run_param_test(struct kunit_suite *suite, struct kunit_case *test_case,
> +                    struct kunit *test,
> +                    struct kunit_result_stats *suite_stats,
> +                    struct kunit_result_stats *total_stats,
> +                    struct kunit_result_stats *param_stats)
>  {
>         char param_desc[KUNIT_PARAM_DESC_SIZE];
> +       const void *curr_param;

checkpatch complains about a missing newline here:

WARNING: Missing a blank line after declarations
#130: FILE: lib/kunit/test.c:693:
+       const void *curr_param;
+       kunit_init_parent_param_test(test_case, test);


> +       kunit_init_parent_param_test(test_case, test);
> +       if (test_case->status == KUNIT_FAILURE) {
> +               kunit_update_stats(param_stats, test->status);
> +               return;
> +       }
> +       /* Get initial param. */
> +       param_desc[0] = '\0';
> +       /* TODO: Make generate_params try-catch */
> +       curr_param = test_case->generate_params(test, NULL, param_desc);
> +       test_case->status = KUNIT_SKIPPED;
> +       kunit_log(KERN_INFO, test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> +                 "KTAP version 1\n");
> +       kunit_log(KERN_INFO, test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> +                 "# Subtest: %s", test_case->name);
> +       if (test->params_array.params &&
> +           test_case->generate_params == kunit_array_gen_params) {
> +               kunit_log(KERN_INFO, test, KUNIT_SUBTEST_INDENT
> +                         KUNIT_SUBTEST_INDENT "1..%zd\n",
> +                         test->params_array.num_params);
> +       }
> +
> +       while (curr_param) {
> +               struct kunit param_test = {
> +                       .param_value = curr_param,
> +                       .param_index = ++test->param_index,
> +                       .parent = test,
> +               };
> +               kunit_init_test(&param_test, test_case->name, NULL);
> +               param_test.log = test_case->log;
> +               kunit_run_case_catch_errors(suite, test_case, &param_test);
> +
> +               if (param_desc[0] == '\0') {
> +                       snprintf(param_desc, sizeof(param_desc),
> +                                "param-%d", param_test.param_index);
> +               }
> +
> +               kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
> +                                     param_test.status,
> +                                     param_test.param_index,
> +                                     param_desc,
> +                                     param_test.status_comment);
> +
> +               kunit_update_stats(param_stats, param_test.status);
> +
> +               /* Get next param. */
> +               param_desc[0] = '\0';
> +               curr_param = test_case->generate_params(test, curr_param,
> +                                                       param_desc);
> +       }
> +       /*
> +        * TODO: Put into a try catch. Since we don't need suite->exit
> +        * for it we can't reuse kunit_try_run_cleanup for this yet.
> +        */
> +       if (test_case->param_exit)
> +               test_case->param_exit(test);
> +       /* TODO: Put this kunit_cleanup into a try-catch. */
> +       kunit_cleanup(test);
> +}
> +
> +static noinline_for_stack void
> +kunit_run_one_test(struct kunit_suite *suite, struct kunit_case *test_case,
> +                  struct kunit_result_stats *suite_stats,
> +                  struct kunit_result_stats *total_stats)
> +{
> +       struct kunit test = { .param_value = NULL, .param_index = 0 };
> +       struct kunit_result_stats param_stats = { 0 };
> +
> +       kunit_init_test(&test, test_case->name, test_case->log);
> +       if (test_case->status == KUNIT_SKIPPED) {
> +               /* Test marked as skip */
> +               test.status = KUNIT_SKIPPED;
> +               kunit_update_stats(&param_stats, test.status);
> +       } else if (!test_case->generate_params) {
> +               /* Non-parameterised test. */
> +               test_case->status = KUNIT_SKIPPED;
> +               kunit_run_case_catch_errors(suite, test_case, &test);
> +               kunit_update_stats(&param_stats, test.status);
> +       } else {
> +               kunit_run_param_test(suite, test_case, &test, suite_stats,
> +                                    total_stats, &param_stats);
> +       }
> +       kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
> +
> +       kunit_print_test_stats(&test, &param_stats);
> +
> +       kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE, test_case->status,
> +                             kunit_test_case_num(suite, test_case),
> +                             test_case->name,
> +                             test.status_comment);
> +
> +       kunit_update_stats(suite_stats, test_case->status);
> +       kunit_accumulate_stats(total_stats, param_stats);
> +}
> +
> +
> +int kunit_run_tests(struct kunit_suite *suite)
> +{
>         struct kunit_case *test_case;
>         struct kunit_result_stats suite_stats = { 0 };
>         struct kunit_result_stats total_stats = { 0 };
> -       const void *curr_param;
>
>         /* Taint the kernel so we know we've run tests. */
>         add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> @@ -703,97 +805,13 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>         kunit_print_suite_start(suite);
>
> -       kunit_suite_for_each_test_case(suite, test_case) {
> -               struct kunit test = { .param_value = NULL, .param_index = 0 };
> -               struct kunit_result_stats param_stats = { 0 };
> -
> -               kunit_init_test(&test, test_case->name, test_case->log);
> -               if (test_case->status == KUNIT_SKIPPED) {
> -                       /* Test marked as skip */
> -                       test.status = KUNIT_SKIPPED;
> -                       kunit_update_stats(&param_stats, test.status);
> -               } else if (!test_case->generate_params) {
> -                       /* Non-parameterised test. */
> -                       test_case->status = KUNIT_SKIPPED;
> -                       kunit_run_case_catch_errors(suite, test_case, &test);
> -                       kunit_update_stats(&param_stats, test.status);
> -               } else {
> -                       kunit_init_parent_param_test(test_case, &test);
> -                       if (test_case->status == KUNIT_FAILURE) {
> -                               kunit_update_stats(&param_stats, test.status);
> -                               goto test_case_end;
> -                       }
> -                       /* Get initial param. */
> -                       param_desc[0] = '\0';
> -                       /* TODO: Make generate_params try-catch */
> -                       curr_param = test_case->generate_params(&test, NULL, param_desc);
> -                       test_case->status = KUNIT_SKIPPED;
> -                       kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> -                                 "KTAP version 1\n");
> -                       kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
> -                                 "# Subtest: %s", test_case->name);
> -                       if (test.params_array.params &&
> -                           test_case->generate_params == kunit_array_gen_params) {
> -                               kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT
> -                                         KUNIT_SUBTEST_INDENT "1..%zd\n",
> -                                         test.params_array.num_params);
> -                       }
> -
> -                       while (curr_param) {
> -                               struct kunit param_test = {
> -                                       .param_value = curr_param,
> -                                       .param_index = ++test.param_index,
> -                                       .parent = &test,
> -                               };
> -                               kunit_init_test(&param_test, test_case->name, NULL);
> -                               param_test.log = test_case->log;
> -                               kunit_run_case_catch_errors(suite, test_case, &param_test);
> -
> -                               if (param_desc[0] == '\0') {
> -                                       snprintf(param_desc, sizeof(param_desc),
> -                                                "param-%d", param_test.param_index);
> -                               }
> -
> -                               kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
> -                                                     param_test.status,
> -                                                     param_test.param_index,
> -                                                     param_desc,
> -                                                     param_test.status_comment);
> -
> -                               kunit_update_stats(&param_stats, param_test.status);
> -
> -                               /* Get next param. */
> -                               param_desc[0] = '\0';
> -                               curr_param = test_case->generate_params(&test, curr_param,
> -                                                                       param_desc);
> -                       }
> -                       /*
> -                        * TODO: Put into a try catch. Since we don't need suite->exit
> -                        * for it we can't reuse kunit_try_run_cleanup for this yet.
> -                        */
> -                       if (test_case->param_exit)
> -                               test_case->param_exit(&test);
> -                       /* TODO: Put this kunit_cleanup into a try-catch. */
> -                       kunit_cleanup(&test);
> -               }
> -test_case_end:
> -               kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
> -
> -               kunit_print_test_stats(&test, param_stats);
> -
> -               kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE, test_case->status,
> -                                     kunit_test_case_num(suite, test_case),
> -                                     test_case->name,
> -                                     test.status_comment);
> -
> -               kunit_update_stats(&suite_stats, test_case->status);
> -               kunit_accumulate_stats(&total_stats, param_stats);
> -       }
> +       kunit_suite_for_each_test_case(suite, test_case)
> +               kunit_run_one_test(suite, test_case, &suite_stats, &total_stats);
>
>         if (suite->suite_exit)
>                 suite->suite_exit(suite);
>
> -       kunit_print_suite_stats(suite, suite_stats, total_stats);
> +       kunit_print_suite_stats(suite, &suite_stats, &total_stats);
>  suite_end:
>         kunit_print_suite_end(suite);
>
> --
> 2.39.5
>

--0000000000003156e60649e6fb69
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
NjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xNDEyMTAwMDAw
MDBaFw0zNDEyMTAwMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMw
EQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjANBgkqhkiG9w0BAQEF
AAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyCtEjG61s8roO4QZIzFKRvf+kqzMaw
iGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5
KE1SGooagLcZgQ5+xIq8ZEwhHENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ
3+QPefXqoh8q0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77YcE1eTtt6y+OKF
t3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fzBjZJdzC8cTflpuwhCHX85mEW
P3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7uj+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoR
h3CBCqiadR2eOoYFAJ7bgNYl+dwFnidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sI
ScWVZBpjDnk99bOMylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HU
Gie/Nx4yB9gUYzwoTK8CAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH
8H/IZ1OgMA0GCSqGSIb3DQEBDAUAA4ICAQCDJe3o0f2VUs2ewASgkWnmXNCE3tytok/oR3jWZZip
W6g8h3wCitFutxZz5l/AVJjVdL7BzeIRka0jGD3d4XJElrSVXsB7jpl4FkMTVlezorM7tXfcQHKs
o+ubNT6xCCGh58RDN3kyvrXnnCxMvEMpmY4w06wh4OMd+tgHM3ZUACIquU0gLnBo2uVT/INc053y
/0QMRGby0uO9RgAabQK6JV2NoTFR3VRGHE3bmZbvGhwEXKYV73jgef5d2z6qTFX9mhWpb+Gm+99w
MOnD7kJG7cKTBYn6fWN7P9BxgXwA6JiuDng0wyX7rwqfIGvdOxOPEoziQRpIenOgd2nHtlx/gsge
/lgbKCuobK1ebcAF0nu364D+JTf+AptorEJdw+71zNzwUHXSNmmc5nsE324GabbeCglIWYfrexRg
emSqaUPvkcdM7BjdbO9TLYyZ4V7ycj7PVMi9Z+ykD0xF/9O5MCMHTI8Qv4aW2ZlatJlXHKTMuxWJ
U7osBQ/kxJ4ZsRg01Uyduu33H68klQR4qAO77oHl2l98i0qhkHQlp7M+S8gsVr3HyO844lyS8Hn3
nIS6dC1hASB+ftHyTwdZX4stQ1LrRgyU4fVmR3l31VRbH60kN8tFWk6gREjI2LCZxRWECfbWSUnA
ZbjmGnFuoKjxguhFPmzWAtcKZ4MFWsmkEDCCBeQwggPMoAMCAQICEAGEC3/wSMy6MPZFqg/DMj8w
DQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMzAeFw0yNTEwMTMyMzQ3
NDlaFw0yNjA0MTEyMzQ3NDlaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5jb20w
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7T8v6fZyfEDlp38NMe4GOXuodILGOFXh6
iVuecsKchx1gCg5Qebyxm+ndfb6ePkd2zzsBOkBJmYrx4G009e+oyTnynr5KXvucs+wLlgm53QU7
6pYikvqTM2hezoWz48Ve/6Jq/6I/eAzKGhn4E/3zG15ETIeMpPFy/E7/lGqq+HFRCb6s0tl/QWhC
BiR+n2UvmXbVWPSR51aRAifsKqiuraeU5g9bGCcbuvdbiYQf1AzNDilkvA6FfUaOPTzVj3rgMyZb
mnZpzWOV1bfib3tYXd2x4IvUS3xlvrap0g9EiDxJKUhCskOf7dPTjaS/kku768Y6U/sDVH5ptgvP
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgctmm8/o8odBdv047euT9WCwXvMAE
EwB7FRETioSeln8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
MjAzMDgxMTA1WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAmo8UVlcbCCfHAuZ3nwm/CTaSUpAAcV+cZDvBssbhoVmJfW8tDn6AolKaPm/M+F1Q
EjTpkSQ0KiKgDMYR9174YQaYpQyQ6wNu1tkCaDyylJ0RulRo4ZbqmmS0uTjzCbrZWBMOzWe9/hDM
1NTNmZ+V/Z2/gWFsyi4rNT+r2Qw/0M9/KwUW4d7Q2fh7qtaAo+tY3+Rf9TD6iSuWvegejRHJYZhs
EE/I9IU8MLvPdvL5et03uzgBouT+JkWeC9tyFC7iAnq436UCPagr63aXnRqMFpT1CRC6z3y0SKZM
xSaZoRHHdZAtmdycA+HaYLJc5RyYaOFKZcCb8I2PkRo8NhFWBw==
--0000000000003156e60649e6fb69--

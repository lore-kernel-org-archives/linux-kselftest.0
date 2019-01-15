From: shuah@kernel.org (shuah)
Date: Mon, 14 Jan 2019 18:39:59 -0700
Subject: [PATCH v4 2/2] selftests/memfd: Add tests for F_SEAL_FUTURE_WRITE
 seal
In-Reply-To: <20190112203816.85534-3-joel@joelfernandes.org>
References: <20190112203816.85534-1-joel@joelfernandes.org>
 <20190112203816.85534-3-joel@joelfernandes.org>
Message-ID: <f9ffb7f8-1ff8-3bec-ce79-f9322d8715dc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190115013959.EJQJvgJMDzokNGf4LOgJkn3VPLBCZnlxt2drFEGE9O8@z>

On 1/12/19 1:38 PM, Joel Fernandes wrote:
> From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> 
> Add tests to verify sealing memfds with the F_SEAL_FUTURE_WRITE works as
> expected.
> 
> Cc: dancol at google.com
> Cc: minchan at kernel.org
> Cc: Jann Horn <jannh at google.com>
> Cc: John Stultz <john.stultz at linaro.org>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---

Looks good to me. For selftest part of the series:

Reviewed-by: Shuah Khan <shuah at kernel.org>

thanks,
-- Shuah

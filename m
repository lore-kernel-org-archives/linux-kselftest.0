From: joel at joelfernandes.org (Joel Fernandes)
Date: Tue, 15 Jan 2019 09:50:05 -0500
Subject: [PATCH v4 2/2] selftests/memfd: Add tests for
 F_SEAL_FUTURE_WRITE seal
In-Reply-To: <f9ffb7f8-1ff8-3bec-ce79-f9322d8715dc@kernel.org>
References: <20190112203816.85534-1-joel@joelfernandes.org>
 <20190112203816.85534-3-joel@joelfernandes.org>
 <f9ffb7f8-1ff8-3bec-ce79-f9322d8715dc@kernel.org>
Message-ID: <20190115145005.GC36681@google.com>

On Mon, Jan 14, 2019 at 06:39:59PM -0700, shuah wrote:
> On 1/12/19 1:38 PM, Joel Fernandes wrote:
> > From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> > 
> > Add tests to verify sealing memfds with the F_SEAL_FUTURE_WRITE works as
> > expected.
> > 
> > Cc: dancol at google.com
> > Cc: minchan at kernel.org
> > Cc: Jann Horn <jannh at google.com>
> > Cc: John Stultz <john.stultz at linaro.org>
> > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > ---
> 
> Looks good to me. For selftest part of the series:
> 
> Reviewed-by: Shuah Khan <shuah at kernel.org>

Thanks!

John, could you provide your Reviewed-by again for patch 1/2 ? I had dropped
it since the patch had some more changes.

thanks,

 - Joel

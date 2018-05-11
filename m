From: shuah@kernel.org (Shuah Khan)
Date: Fri, 11 May 2018 09:25:22 -0600
Subject: [PATCH] selftests: futex: delete RUN_TESTS and EMIT_TESTS
 overrides
In-Reply-To: <20180511151320.GA6391@fury>
References: <20180502211848.22404-1-shuah@kernel.org>
 <20180502211848.22404-2-shuah@kernel.org> <20180511151320.GA6391@fury>
Message-ID: <1ab4e7fb-91af-e706-a6df-e7d9f16e21ae@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511152522.-W1MtlqjoZ1Enw6UlxBkmEWhWVmII5OJ2GuB0jWCROE@z>

On 05/11/2018 09:13 AM, Darren Hart wrote:
> On Wed, May 02, 2018@03:18:45PM -0600, Shuah Khan (Samsung OSG) wrote:
>> Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
>> lib.mk. Common defines work just fine and there is no need to define
>> custom overrides.
>>
>> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> 
> I was concerned because this override was a deliberate decision made in:
> 
> 9705315b7562 selftests/futex: Update Makefile to use lib.mk

Yes I had the same concern.
> 
> But reviewing lib.mk today, the RUN_TESTS and EMIT_TESTS perform the same
> function running TEST_PROGS.
> 
> Reviewed-by: Darren Hart (VMware) <dvhart at infradead.org>
> 

Thanks. Yes I was surprised as well. I ran a few times to make sure. :)

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

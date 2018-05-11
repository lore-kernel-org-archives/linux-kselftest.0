From: tj@kernel.org (Tejun Heo)
Date: Fri, 11 May 2018 13:02:50 -0700
Subject: [PATCH v2] selftests/cgroup: memory controller self-tests
In-Reply-To: <fb835740-cee8-83f8-880c-ea6eea8c7c63@kernel.org>
References: <20180510163701.28936-1-guro@fb.com>
 <20180510183224.GP2368884@devbig577.frc2.facebook.com>
 <a652ce44-07f9-d229-70d4-4376bfbafa40@kernel.org>
 <20180511143228.GU2368884@devbig577.frc2.facebook.com>
 <ae4dc3f9-baa6-b492-7c43-0359734440b3@kernel.org>
 <20180511162920.GV2368884@devbig577.frc2.facebook.com>
 <957d089f-7a88-9ff4-733a-8e082339720c@kernel.org>
 <20180511180342.GA20683@castle>
 <fb835740-cee8-83f8-880c-ea6eea8c7c63@kernel.org>
Message-ID: <20180511200250.GW2368884@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511200250.hKi5F2f8pPKzRFRTgba07aNH2NM8pfU9K1iEH5B0_oo@z>

On Fri, May 11, 2018@01:33:26PM -0600, Shuah Khan wrote:
> Yeah. I see that. You have a switch for the KSFT_ values. Since there is no
> dependency on the cgroup tree, I would recommend having this patch go through
> kselftest tree which is the normal process for tests anyway.
> 
> This version is good and I can apply this to linux-kselftest next. I ran a
> quick test and the Skip case looks good.
> 
> TAP version 13
> selftests: cgroup: test_memcontrol
> ========================================
> 1..0 # Skipped: memory controller isn't available
> not ok 1..1 selftests: cgroup: test_memcontrol [SKIP]
> 
> 
> Tejun! Please send me your Ack.

Sure, please feel free to add my ack.  I'll revert the original patch
from cgroup tree.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

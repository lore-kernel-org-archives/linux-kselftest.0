From: shuah@kernel.org (Shuah Khan)
Date: Fri, 11 May 2018 14:22:05 -0600
Subject: [PATCH v2] selftests/cgroup: memory controller self-tests
In-Reply-To: <20180511200250.GW2368884@devbig577.frc2.facebook.com>
References: <20180510163701.28936-1-guro@fb.com>
 <20180510183224.GP2368884@devbig577.frc2.facebook.com>
 <a652ce44-07f9-d229-70d4-4376bfbafa40@kernel.org>
 <20180511143228.GU2368884@devbig577.frc2.facebook.com>
 <ae4dc3f9-baa6-b492-7c43-0359734440b3@kernel.org>
 <20180511162920.GV2368884@devbig577.frc2.facebook.com>
 <957d089f-7a88-9ff4-733a-8e082339720c@kernel.org>
 <20180511180342.GA20683@castle>
 <fb835740-cee8-83f8-880c-ea6eea8c7c63@kernel.org>
 <20180511200250.GW2368884@devbig577.frc2.facebook.com>
Message-ID: <1b9740f8-953a-985d-ba21-551e6064a572@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511202205.NL5QNSCPaBdJvfTiJLm_Lbpf3UVHTGgMfoo6BZ93PU4@z>

On 05/11/2018 02:02 PM, Tejun Heo wrote:
> On Fri, May 11, 2018@01:33:26PM -0600, Shuah Khan wrote:
>> Yeah. I see that. You have a switch for the KSFT_ values. Since there is no
>> dependency on the cgroup tree, I would recommend having this patch go through
>> kselftest tree which is the normal process for tests anyway.
>>
>> This version is good and I can apply this to linux-kselftest next. I ran a
>> quick test and the Skip case looks good.
>>
>> TAP version 13
>> selftests: cgroup: test_memcontrol
>> ========================================
>> 1..0 # Skipped: memory controller isn't available
>> not ok 1..1 selftests: cgroup: test_memcontrol [SKIP]
>>
>>
>> Tejun! Please send me your Ack.
> 
> Sure, please feel free to add my ack.  I'll revert the original patch
> from cgroup tree.
> 
> Thanks.
> 

Thanks. I will apply this to linux-kselftest next for 4.18-rc1 with
you Ack.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

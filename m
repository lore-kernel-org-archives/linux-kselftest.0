Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810E535836A;
	Thu, 12 Mar 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315055; cv=none; b=sLiHzYtqVzmBKY9lFWLscK0fygzQ5/nGjcEcNHZaYW7288VO0vWdMpXWzigrz/pgi7/HQ4cVXcySocoX0zpveFu1rtiuUJNBT7f7FlJa3pnLiP7Bvrj2Srl4CFT97jGeuJqgFZiuoK+rL7aWEs6XNWVMjQod21gtVghizzy2DOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315055; c=relaxed/simple;
	bh=8eO9f6GS12QaklGw/ALX78y3TvY7L5aReHcVe4U0Pg4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=VZpOKjVCicS+nL2QwWziz66Cyb4LCcFd+klxAAx8oJUeHjTkSSuhGZHPLmHXGu7Tvd7OXchaswlhEk0p2uSwtqjaeNKnZ8OAs7UtKcY9RHMWRvab0ofEsFWiSr8u1WvxqKo6O5qwxSmGeurbRSShAZ52QATFjta2iIe5NzLKyRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6B84497;
	Thu, 12 Mar 2026 04:30:46 -0700 (PDT)
Received: from [10.1.32.88] (e127648.arm.com [10.1.32.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B8843F7BD;
	Thu, 12 Mar 2026 04:30:50 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------GMXuTZTbAfWY57eKYcml8xdB"
Message-ID: <415c7e66-11d5-482a-84b6-d4496c597c1a@arm.com>
Date: Thu, 12 Mar 2026 11:30:48 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/7] selftests/sched: Add SCHED_DEADLINE bandwidth
 tests to kselftest
From: Christian Loehle <christian.loehle@arm.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-5-2b23ef74c46a@redhat.com>
 <129bb66c-74fa-4795-8d79-6c8e10a66e17@arm.com>
 <abFsuvsmEdoypYs4@jlelli-thinkpadt14gen4.remote.csb>
 <da6b6b85-25f1-4b22-9638-d68b161331a4@arm.com>
 <1d09f674-0c0b-47fc-abaf-6db6b01c775c@arm.com>
 <6e2ac024-04d1-43e9-b209-939e622724d8@arm.com>
Content-Language: en-US
In-Reply-To: <6e2ac024-04d1-43e9-b209-939e622724d8@arm.com>

This is a multi-part message in MIME format.
--------------GMXuTZTbAfWY57eKYcml8xdB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/12/26 10:43, Christian Loehle wrote:
> On 3/11/26 14:26, Christian Loehle wrote:
>> On 3/11/26 13:44, Christian Loehle wrote:
>>> On 3/11/26 13:23, Juri Lelli wrote:
>>>> On 11/03/26 09:31, Christian Loehle wrote:
>>>>> On 3/6/26 16:10, Juri Lelli wrote:
>>>>
>>>> ...
>>>>
>>>>>> +	/* Start one cpuhog per CPU at max bandwidth */
>>>>>> +	printf("  Starting %d cpuhog tasks at max bandwidth...\n", num_cpus);
>>>>>> +
>>>>>> +	for (i = 0; i < num_cpus; i++) {
>>>>>> +		pids[i] = dl_create_cpuhog(runtime_ns, deadline_ns, period_ns, 0);
>>>>>> +		if (pids[i] < 0) {
>>>>>> +			printf("  Task %d failed to start: %s\n",
>>>>>> +			       i + 1, strerror(errno));
>>>>>> +			goto cleanup;
>>>>>> +		}
>>>>>> +		started++;
>>>>>> +	}
>>>>>
>>>>> Would it be okay to just have one task per max-cap CPU to make this pass on HMP?
>>>>> Or something more sophisticated?
>>>>>
>>>>
>>>> On HMP we should probably have max bandwidth hogs on big CPUs and then
>>>> scale runtime (bandwidth) considering smaller CPUs capacities. Cannot
>>>> quickly check atm, but that info (max cap per-CPU) is available
>>>> somewhere in sys or proc, is it?
>>>
>>> Yes it's here:
>>> /sys/devices/system/cpu/cpu0/cpu_capacity
>>>
>>> FWIW I've attached the two patches to get a pass out of arm64 HMP.
>>
>> Wait nevermind, this isn't right, this would expect a 10 CPU system with
>> [1024, 128, 128, 128, 128, 128, 128, 128, 128, 128]
>> = 2176
>> would allow for 2 1024-equivalent hogs, but that is obviously wrong as
>> the capacity -> bandwidth calculation must be capped in practice by
>> only summing the k-highest-cap-CPUs if there's only k deadline-tasks.
>>
>> Let me go and read how this is actually supposed to work.
> 
> Nevermind the nevermind, it's a bit counterintuitive because we specifically
> test this edgecase here but my original proposal is fine...
> 
> if you're still taking suggestions, I think a test with hotplugging and
> bandwidth would be nice, too:
> 
> -Fill to max, verify extra admission fails.
> -Kill one task, offline one CPU, verify offline succeeds.
> -Try respawn while CPU is offline, verify admission fails.
> -Online CPU again, verify respawn succeeds.
> 

For completeness, although I'm sure you can come up with something equally good:

# ===== START =====
# TEST: bandwidth_hotplug_accounting
# DESCRIPTION: Verify capacity-scaled bandwidth accounting across CPU hotplug
# OUTPUT:
#   RT bandwidth: runtime=950000µs, period=1000000µs (95%)
#   Number of online CPUs: 12
#   Equivalent max-capacity CPUs: 8.47
#   Max-capacity CPU: 0 (capacity=1024)
#   DL server overhead on max-capacity CPU: 10.00%
#   Task params: runtime=85ms, deadline=100ms, period=100ms
#   Expected tasks at max-capacity bandwidth: 8
#   Selected hotpluggable CPU: 1
#   Expected tasks after offline: 7
#   Starting 8 tasks at max-capacity bandwidth...
#   Verifying additional task is rejected...
#   Additional task correctly rejected: Device or resource busy
#   Killing one task before CPU offline...
#   Offlining CPU 1...
#   Trying to respawn one task with CPU offline (expect reject)...
#   Respawn correctly rejected: Device or resource busy
#   Onlining CPU 1...
#   Trying to respawn one task with CPU online (expect success)...
#   SUCCESS: Hotplug accounting matched capacity-scaled expectations
# ok 5 bandwidth_hotplug_accounting # 
# =====  END  =====


--------------GMXuTZTbAfWY57eKYcml8xdB
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-selftests-sched-Add-a-hotplug-bandwidth-selftest.patch"
Content-Disposition: attachment;
 filename*0="0001-selftests-sched-Add-a-hotplug-bandwidth-selftest.patch"
Content-Transfer-Encoding: base64

RnJvbSA3ODhlMzc2MWNjZmQyMTQzZjljYTBlZTI5ODE4NjViYjViNjBhNmE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaHJpc3RpYW4gTG9laGxlIDxjaHJpc3RpYW4ubG9l
aGxlQGFybS5jb20+CkRhdGU6IFRodSwgMTIgTWFyIDIwMjYgMTE6Mjg6MjUgKzAwMDAKU3Vi
amVjdDogW1BBVENIXSBzZWxmdGVzdHMvc2NoZWQ6IEFkZCBhIGhvdHBsdWctYmFuZHdpZHRo
IHNlbGZ0ZXN0CgpCYW5kd2lkdGggaXMgcmVjYWxjdWxhdGVkIHdoZW4gQ1BVIGhvdHBsdWdn
aW5nLCBzbyBhZGQgYSB0ZXN0IGZvcjoKLVNwYXduIGFsbCBjYXBhY2l0eS1jb21wdXRlZCB0
YXNrcy4KLVZlcmlmeSBvbmUgbW9yZSBpcyByZWplY3RlZC4KLUtpbGwgb25lIHRhc2suCi1P
ZmZsaW5lIHNlbGVjdGVkIGhvdHBsdWdnYWJsZSBDUFUuCi1WZXJpZnkgcmVzcGF3biBmYWls
cy4KLU9ubGluZSBDUFUuCi1WZXJpZnkgcmVzcGF3biBzdWNjZWVkcy4KClNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBMb2VobGUgPGNocmlzdGlhbi5sb2VobGVAYXJtLmNvbT4KLS0tCiAu
Li4vc2VsZnRlc3RzL3NjaGVkL2RlYWRsaW5lL2JhbmR3aWR0aC5jICAgICAgfCAyNjYgKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjY2IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zY2hlZC9kZWFkbGluZS9iYW5k
d2lkdGguYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3NjaGVkL2RlYWRsaW5lL2JhbmR3
aWR0aC5jCmluZGV4IGY5MzFiNmJkZGFjNi4uNmRkNWU2MWJiNGZiIDEwMDY0NAotLS0gYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zY2hlZC9kZWFkbGluZS9iYW5kd2lkdGguYworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zY2hlZC9kZWFkbGluZS9iYW5kd2lkdGguYwpA
QCAtMzcsNiArMzcsNyBAQCBzdHJ1Y3QgZGxfYndfdGVzdF9jb25maWcgewogCXVuc2lnbmVk
IGxvbmcgbWF4X2NwdV9jYXBhY2l0eTsKIAlpbnQgbnVtX2NwdXM7CiAJaW50IG1heF9jcHU7
CisJaW50IG1heF9jcHVfY291bnQ7CiAJaW50IGV4cGVjdGVkX3Rhc2tzOwogfTsKIApAQCAt
MTI2LDYgKzEyNywxMDQgQEAgc3RhdGljIGRvdWJsZSBid19zY2FsZWRfdG9fcGVyY2VudCh1
aW50NjRfdCBzY2FsZWQpCiAJcmV0dXJuIChkb3VibGUpc2NhbGVkICogMTAwLjAgLyBETF9C
V19TQ0FMRTsKIH0KIAorc3RhdGljIGludCBid19leHBlY3RlZF90YXNrc19mb3JfdG90YWxz
KGNvbnN0IHN0cnVjdCBkbF9id190ZXN0X2NvbmZpZyAqY2ZnLAorCQkJCQl1bnNpZ25lZCBs
b25nIHRvdGFsX2NwdV9jYXBhY2l0eSwKKwkJCQkJdWludDY0X3QgdG90YWxfc2VydmVyX2J3
X3NjYWxlZCkKK3sKKwlfX3VpbnQxMjhfdCB0b3RhbF9ydF9idzsKKwlfX3VpbnQxMjhfdCB0
b3RhbF9zZXJ2ZXJfYnc7CisJX191aW50MTI4X3QgdG90YWxfYXZhaWxhYmxlX2J3OworCV9f
dWludDEyOF90IHRhc2tfYndfY2FwYWNpdHk7CisKKwl0b3RhbF9ydF9idyA9IChfX3VpbnQx
MjhfdCl0b3RhbF9jcHVfY2FwYWNpdHkgKiBjZmctPnJ0X2J3X3NjYWxlZDsKKwl0b3RhbF9z
ZXJ2ZXJfYncgPSAoX191aW50MTI4X3QpY2ZnLT5tYXhfY3B1X2NhcGFjaXR5ICoKKwkJCSAg
dG90YWxfc2VydmVyX2J3X3NjYWxlZDsKKwlpZiAodG90YWxfcnRfYncgPD0gdG90YWxfc2Vy
dmVyX2J3KQorCQlyZXR1cm4gMDsKKworCXRvdGFsX2F2YWlsYWJsZV9idyA9IHRvdGFsX3J0
X2J3IC0gdG90YWxfc2VydmVyX2J3OworCXRhc2tfYndfY2FwYWNpdHkgPSAoX191aW50MTI4
X3QpY2ZnLT5tYXhfY3B1X2NhcGFjaXR5ICoKKwkJCSAgIGNmZy0+dGFza19id19zY2FsZWQ7
CisJaWYgKCF0YXNrX2J3X2NhcGFjaXR5KQorCQlyZXR1cm4gMDsKKworCXJldHVybiB0b3Rh
bF9hdmFpbGFibGVfYncgLyB0YXNrX2J3X2NhcGFjaXR5OworfQorCitzdGF0aWMgaW50IGJ3
X3dhaXRfY3B1X3N0YXRlKGludCBjcHUsIGludCBvbmxpbmUsIGludCB0aW1lb3V0X21zKQor
eworCWludCB3YWl0ZWRfbXMgPSAwOworCisJd2hpbGUgKHdhaXRlZF9tcyA8IHRpbWVvdXRf
bXMpIHsKKwkJaWYgKGRsX2lzX2NwdV9vbmxpbmUoY3B1KSA9PSBvbmxpbmUpCisJCQlyZXR1
cm4gMDsKKworCQl1c2xlZXAoMTAwMDApOyAvKiAxMG1zICovCisJCXdhaXRlZF9tcyArPSAx
MDsKKwl9CisKKwlyZXR1cm4gLTE7Cit9CisKK3N0YXRpYyBpbnQgYndfZmluZF9ob3RwbHVn
X2NwdV9mb3Jfb2ZmbGluZV90ZXN0KAorCQljb25zdCBzdHJ1Y3QgZGxfYndfdGVzdF9jb25m
aWcgKmNmZywKKwkJaW50ICpleHBlY3RlZF90YXNrc19hZnRlcl9vZmZsaW5lKQoreworCWlu
dCBtYXhfY3B1czsKKwlpbnQgaG90cGx1Z19jb3VudDsKKwlpbnQgKmhvdHBsdWdfY3B1czsK
KwlpbnQgaTsKKwlpbnQgc2VsZWN0ZWRfY3B1ID0gLTE7CisKKwltYXhfY3B1cyA9IChpbnQp
c3lzY29uZihfU0NfTlBST0NFU1NPUlNfQ09ORik7CisJaWYgKG1heF9jcHVzIDw9IDApCisJ
CXJldHVybiAtMTsKKworCWhvdHBsdWdfY3B1cyA9IGNhbGxvYyhtYXhfY3B1cywgc2l6ZW9m
KGludCkpOworCWlmICghaG90cGx1Z19jcHVzKQorCQlyZXR1cm4gLTE7CisKKwlob3RwbHVn
X2NvdW50ID0gZGxfZ2V0X2hvdHBsdWdnYWJsZV9jcHVzKGhvdHBsdWdfY3B1cywgbWF4X2Nw
dXMpOworCWlmIChob3RwbHVnX2NvdW50IDw9IDApCisJCWdvdG8gb3V0OworCisJZm9yIChp
ID0gMDsgaSA8IGhvdHBsdWdfY291bnQ7IGkrKykgeworCQlpbnQgY3B1ID0gaG90cGx1Z19j
cHVzW2ldOworCQl1bnNpZ25lZCBsb25nIGNhcGFjaXR5OworCQl1aW50NjRfdCBzZXJ2ZXJf
Ync7CisJCWludCBleHBlY3RlZF9hZnRlcjsKKworCQlpZiAoIWJ3X2lzX2NwdV9vbmxpbmUo
Y3B1KSkKKwkJCWNvbnRpbnVlOworCisJCWJ3X2dldF9jcHVfY2FwYWNpdHkoY3B1LCAmY2Fw
YWNpdHkpOworCQlzZXJ2ZXJfYncgPSBid19nZXRfc2VydmVyX2J3X3NjYWxlZChjcHUpOwor
CisJCWlmIChjZmctPnRvdGFsX2NwdV9jYXBhY2l0eSA8PSBjYXBhY2l0eSkKKwkJCWNvbnRp
bnVlOworCQlpZiAoY2ZnLT50b3RhbF9zZXJ2ZXJfYndfc2NhbGVkIDwgc2VydmVyX2J3KQor
CQkJY29udGludWU7CisKKwkJaWYgKGNhcGFjaXR5ID09IGNmZy0+bWF4X2NwdV9jYXBhY2l0
eSAmJiBjZmctPm1heF9jcHVfY291bnQgPT0gMSkKKwkJCWNvbnRpbnVlOworCisJCWV4cGVj
dGVkX2FmdGVyID0gYndfZXhwZWN0ZWRfdGFza3NfZm9yX3RvdGFscyhjZmcsCisJCQkJCWNm
Zy0+dG90YWxfY3B1X2NhcGFjaXR5IC0gY2FwYWNpdHksCisJCQkJCWNmZy0+dG90YWxfc2Vy
dmVyX2J3X3NjYWxlZCAtIHNlcnZlcl9idyk7CisKKwkJaWYgKGV4cGVjdGVkX2FmdGVyID09
IGNmZy0+ZXhwZWN0ZWRfdGFza3MgLSAxKSB7CisJCQlzZWxlY3RlZF9jcHUgPSBjcHU7CisJ
CQlpZiAoZXhwZWN0ZWRfdGFza3NfYWZ0ZXJfb2ZmbGluZSkKKwkJCQkqZXhwZWN0ZWRfdGFz
a3NfYWZ0ZXJfb2ZmbGluZSA9IGV4cGVjdGVkX2FmdGVyOworCQkJYnJlYWs7CisJCX0KKwl9
CisKK291dDoKKwlmcmVlKGhvdHBsdWdfY3B1cyk7CisJcmV0dXJuIHNlbGVjdGVkX2NwdTsK
K30KKwogc3RhdGljIGVudW0gZGxfdGVzdF9zdGF0dXMgYndfcHJlcGFyZV90ZXN0KHN0cnVj
dCBkbF9id190ZXN0X2NvbmZpZyAqY2ZnKQogewogCWludCBjcHU7CkBAIC0xNjksNiArMjY4
LDkgQEAgc3RhdGljIGVudW0gZGxfdGVzdF9zdGF0dXMgYndfcHJlcGFyZV90ZXN0KHN0cnVj
dCBkbF9id190ZXN0X2NvbmZpZyAqY2ZnKQogCQkJY2ZnLT5tYXhfY3B1X2NhcGFjaXR5ID0g
Y2FwYWNpdHk7CiAJCQljZmctPm1heF9jcHVfc2VydmVyX2J3X3NjYWxlZCA9IHNlcnZlcl9i
dzsKIAkJCWNmZy0+bWF4X2NwdSA9IGNwdTsKKwkJCWNmZy0+bWF4X2NwdV9jb3VudCA9IDE7
CisJCX0gZWxzZSBpZiAoY2FwYWNpdHkgPT0gY2ZnLT5tYXhfY3B1X2NhcGFjaXR5KSB7CisJ
CQljZmctPm1heF9jcHVfY291bnQrKzsKIAkJfQogCX0KIApAQCAtNDA5LDMgKzUxMSwxNjcg
QEAgc3RhdGljIHN0cnVjdCBkbF90ZXN0IHRlc3RfYmFuZHdpZHRoX292ZXJmbG93ID0gewog
CS5ydW4gPSB0ZXN0X2JhbmR3aWR0aF9vdmVyZmxvd19ydW4sCiB9OwogUkVHSVNURVJfRExf
VEVTVCgmdGVzdF9iYW5kd2lkdGhfb3ZlcmZsb3cpOworCisvKgorICogVGVzdDogQ2FwYWNp
dHktc2NhbGVkIGJhbmR3aWR0aCBhY2NvdW50aW5nIGFjcm9zcyBDUFUgaG90cGx1ZworICoK
KyAqIFZlcmlmaWVzIHRoYXQgYWRtaXNzaW9uIGFjY291bnRpbmcgdHJhY2tzIENQVSBvZmZs
aW5lL29ubGluZSB0cmFuc2l0aW9ucyBvbgorICogYXN5bW1ldHJpYyBzeXN0ZW1zIHVzaW5n
IHRoZSBzYW1lIGNhcGFjaXR5LXNjYWxlZCBtYXRoIGFzIGFkbWlzc2lvbjoKKyAqCisgKiAx
KSBTcGF3biBhbGwgZXhwZWN0ZWQgbWF4LWNhcGFjaXR5IHRhc2tzLgorICogMikgVmVyaWZ5
IG9uZSBtb3JlIHRhc2sgY2Fubm90IGJlIGFkbWl0dGVkLgorICogMykgS2lsbCBvbmUgdGFz
ayBhbmQgb2ZmbGluZSBvbmUgc2VsZWN0ZWQgaG90cGx1Z2dhYmxlIENQVS4KKyAqIDQpIFZl
cmlmeSByZXNwYXduIGZhaWxzIHdoaWxlIENQVSBpcyBvZmZsaW5lLgorICogNSkgT25saW5l
IHRoZSBDUFUgYW5kIHZlcmlmeSByZXNwYXduIHN1Y2NlZWRzLgorICovCitzdGF0aWMgZW51
bSBkbF90ZXN0X3N0YXR1cyB0ZXN0X2JhbmR3aWR0aF9ob3RwbHVnX2FjY291bnRpbmdfcnVu
KHZvaWQgKmN0eCkKK3sKKwlzdHJ1Y3QgZGxfYndfdGVzdF9jb25maWcgY2ZnOworCWludCBl
eHBlY3RlZF9hZnRlcl9vZmZsaW5lID0gLTE7CisJaW50IGhvdHBsdWdfY3B1OworCXBpZF90
ICpwaWRzID0gTlVMTDsKKwlwaWRfdCBwcm9iZV9waWQ7CisJaW50IHN0YXJ0ZWQgPSAwOwor
CWludCBpOworCWJvb2wgY3B1X29mZmxpbmVkID0gZmFsc2U7CisJZW51bSBkbF90ZXN0X3N0
YXR1cyByZXQgPSBETF9URVNUX0ZBSUw7CisKKwlETF9GQUlMX0lGKGJ3X3ByZXBhcmVfdGVz
dCgmY2ZnKSAhPSBETF9URVNUX1BBU1MsCisJCSAgICJGYWlsZWQgdG8gcHJlcGFyZSBiYW5k
d2lkdGggdGVzdCBwYXJhbWV0ZXJzIik7CisJYndfcHJpbnRfdGVzdF9jb25maWcoJmNmZyk7
CisKKwlpZiAoY2ZnLmV4cGVjdGVkX3Rhc2tzIDwgMikgeworCQlwcmludGYoIiAgTmVlZCBh
dCBsZWFzdCAyIGV4cGVjdGVkIHRhc2tzIGZvciBob3RwbHVnIHRlc3QgKGhhdmUgJWQpXG4i
LAorCQkgICAgICAgY2ZnLmV4cGVjdGVkX3Rhc2tzKTsKKwkJcmV0dXJuIERMX1RFU1RfU0tJ
UDsKKwl9CisKKwlob3RwbHVnX2NwdSA9IGJ3X2ZpbmRfaG90cGx1Z19jcHVfZm9yX29mZmxp
bmVfdGVzdCgmY2ZnLAorCQkJCQkJICAgJmV4cGVjdGVkX2FmdGVyX29mZmxpbmUpOworCWlm
IChob3RwbHVnX2NwdSA8IDApIHsKKwkJcHJpbnRmKCIgIE5vIHN1aXRhYmxlIGhvdHBsdWdn
YWJsZSBDUFUgZm91bmQgZm9yIGV4YWN0IG9mZmxpbmUvb25saW5lIHRyYW5zaXRpb25cbiIp
OworCQlyZXR1cm4gRExfVEVTVF9TS0lQOworCX0KKworCXByaW50ZigiICBTZWxlY3RlZCBo
b3RwbHVnZ2FibGUgQ1BVOiAlZFxuIiwgaG90cGx1Z19jcHUpOworCXByaW50ZigiICBFeHBl
Y3RlZCB0YXNrcyBhZnRlciBvZmZsaW5lOiAlZFxuIiwgZXhwZWN0ZWRfYWZ0ZXJfb2ZmbGlu
ZSk7CisKKwlwaWRzID0gY2FsbG9jKGNmZy5leHBlY3RlZF90YXNrcyArIDEsIHNpemVvZihw
aWRfdCkpOworCURMX0ZBSUxfSUYoIXBpZHMsICJGYWlsZWQgdG8gYWxsb2NhdGUgUElEIGFy
cmF5Iik7CisKKwlwcmludGYoIiAgU3RhcnRpbmcgJWQgdGFza3MgYXQgbWF4LWNhcGFjaXR5
IGJhbmR3aWR0aC4uLlxuIiwKKwkgICAgICAgY2ZnLmV4cGVjdGVkX3Rhc2tzKTsKKworCWZv
ciAoaSA9IDA7IGkgPCBjZmcuZXhwZWN0ZWRfdGFza3M7IGkrKykgeworCQlwaWRzW2ldID0g
ZGxfY3JlYXRlX2NwdWhvZyhjZmcucnVudGltZV9ucywgY2ZnLmRlYWRsaW5lX25zLAorCQkJ
CQkgIGNmZy5wZXJpb2RfbnMsIDApOworCQlpZiAocGlkc1tpXSA8IDApIHsKKwkJCXByaW50
ZigiICBUYXNrICVkIGZhaWxlZCB0byBzdGFydDogJXNcbiIsCisJCQkgICAgICAgaSArIDEs
IHN0cmVycm9yKGVycm5vKSk7CisJCQlnb3RvIGNsZWFudXA7CisJCX0KKwkJc3RhcnRlZCsr
OworCX0KKworCXVzbGVlcCg1MDAwMDApOworCisJcHJpbnRmKCIgIFZlcmlmeWluZyBhZGRp
dGlvbmFsIHRhc2sgaXMgcmVqZWN0ZWQuLi5cbiIpOworCXByb2JlX3BpZCA9IGRsX2NyZWF0
ZV9jcHVob2coY2ZnLnJ1bnRpbWVfbnMsIGNmZy5kZWFkbGluZV9ucywKKwkJCQkgICAgIGNm
Zy5wZXJpb2RfbnMsIDApOworCWlmIChwcm9iZV9waWQgPj0gMCkgeworCQlwcmludGYoIiAg
RVJST1I6IEFkZGl0aW9uYWwgdGFzayBhZG1pdHRlZCBhdCBzYXR1cmF0aW9uXG4iKTsKKwkJ
ZGxfY2xlYW51cF9jcHVob2cocHJvYmVfcGlkKTsKKwkJZ290byBjbGVhbnVwOworCX0KKwor
CXByaW50ZigiICBBZGRpdGlvbmFsIHRhc2sgY29ycmVjdGx5IHJlamVjdGVkOiAlc1xuIiwg
c3RyZXJyb3IoZXJybm8pKTsKKworCXByaW50ZigiICBLaWxsaW5nIG9uZSB0YXNrIGJlZm9y
ZSBDUFUgb2ZmbGluZS4uLlxuIik7CisJZGxfY2xlYW51cF9jcHVob2cocGlkc1tzdGFydGVk
IC0gMV0pOworCXBpZHNbc3RhcnRlZCAtIDFdID0gMDsKKwlzdGFydGVkLS07CisKKwl1c2xl
ZXAoMjAwMDAwKTsKKworCXByaW50ZigiICBPZmZsaW5pbmcgQ1BVICVkLi4uXG4iLCBob3Rw
bHVnX2NwdSk7CisJaWYgKGRsX2NwdV9vZmZsaW5lKGhvdHBsdWdfY3B1KSA8IDApIHsKKwkJ
RExfRVJSKCJGYWlsZWQgdG8gb2ZmbGluZSBDUFUgJWQ6ICVzIiwgaG90cGx1Z19jcHUsIHN0
cmVycm9yKGVycm5vKSk7CisJCWdvdG8gY2xlYW51cDsKKwl9CisKKwlpZiAoYndfd2FpdF9j
cHVfc3RhdGUoaG90cGx1Z19jcHUsIDAsIDMwMDApIDwgMCkgeworCQlETF9FUlIoIkNQVSAl
ZCBkaWQgbm90IHRyYW5zaXRpb24gdG8gb2ZmbGluZSBzdGF0ZSIsIGhvdHBsdWdfY3B1KTsK
KwkJZ290byBjbGVhbnVwOworCX0KKworCWNwdV9vZmZsaW5lZCA9IHRydWU7CisJdXNsZWVw
KDMwMDAwMCk7CisKKwlwcmludGYoIiAgVHJ5aW5nIHRvIHJlc3Bhd24gb25lIHRhc2sgd2l0
aCBDUFUgb2ZmbGluZSAoZXhwZWN0IHJlamVjdCkuLi5cbiIpOworCXByb2JlX3BpZCA9IGRs
X2NyZWF0ZV9jcHVob2coY2ZnLnJ1bnRpbWVfbnMsIGNmZy5kZWFkbGluZV9ucywKKwkJCQkg
ICAgIGNmZy5wZXJpb2RfbnMsIDApOworCWlmIChwcm9iZV9waWQgPj0gMCkgeworCQlwcmlu
dGYoIiAgRVJST1I6IFJlc3Bhd24gYWRtaXR0ZWQgd2hpbGUgQ1BVIGlzIG9mZmxpbmVcbiIp
OworCQlkbF9jbGVhbnVwX2NwdWhvZyhwcm9iZV9waWQpOworCQlnb3RvIGNsZWFudXA7CisJ
fQorCisJcHJpbnRmKCIgIFJlc3Bhd24gY29ycmVjdGx5IHJlamVjdGVkOiAlc1xuIiwgc3Ry
ZXJyb3IoZXJybm8pKTsKKworCXByaW50ZigiICBPbmxpbmluZyBDUFUgJWQuLi5cbiIsIGhv
dHBsdWdfY3B1KTsKKwlpZiAoZGxfY3B1X29ubGluZShob3RwbHVnX2NwdSkgPCAwKSB7CisJ
CURMX0VSUigiRmFpbGVkIHRvIG9ubGluZSBDUFUgJWQ6ICVzIiwgaG90cGx1Z19jcHUsIHN0
cmVycm9yKGVycm5vKSk7CisJCWdvdG8gY2xlYW51cDsKKwl9CisKKwlpZiAoYndfd2FpdF9j
cHVfc3RhdGUoaG90cGx1Z19jcHUsIDEsIDUwMDApIDwgMCkgeworCQlETF9FUlIoIkNQVSAl
ZCBkaWQgbm90IHRyYW5zaXRpb24gdG8gb25saW5lIHN0YXRlIiwgaG90cGx1Z19jcHUpOwor
CQlnb3RvIGNsZWFudXA7CisJfQorCisJY3B1X29mZmxpbmVkID0gZmFsc2U7CisJdXNsZWVw
KDMwMDAwMCk7CisKKwlwcmludGYoIiAgVHJ5aW5nIHRvIHJlc3Bhd24gb25lIHRhc2sgd2l0
aCBDUFUgb25saW5lIChleHBlY3Qgc3VjY2VzcykuLi5cbiIpOworCXBpZHNbc3RhcnRlZF0g
PSBkbF9jcmVhdGVfY3B1aG9nKGNmZy5ydW50aW1lX25zLCBjZmcuZGVhZGxpbmVfbnMsCisJ
CQkJCSBjZmcucGVyaW9kX25zLCAwKTsKKwlpZiAocGlkc1tzdGFydGVkXSA8IDApIHsKKwkJ
RExfRVJSKCJSZXNwYXduIGZhaWxlZCBhZnRlciBDUFUgb25saW5lOiAlcyIsIHN0cmVycm9y
KGVycm5vKSk7CisJCWdvdG8gY2xlYW51cDsKKwl9CisKKwlpZiAoIWRsX2lzX2RlYWRsaW5l
X3Rhc2socGlkc1tzdGFydGVkXSkpIHsKKwkJRExfRVJSKCJSZXNwYXduZWQgdGFzayBpcyBu
b3QgcnVubmluZyB3aXRoIFNDSEVEX0RFQURMSU5FIik7CisJCWRsX2NsZWFudXBfY3B1aG9n
KHBpZHNbc3RhcnRlZF0pOworCQlwaWRzW3N0YXJ0ZWRdID0gMDsKKwkJZ290byBjbGVhbnVw
OworCX0KKworCXN0YXJ0ZWQrKzsKKwlwcmludGYoIiAgU1VDQ0VTUzogSG90cGx1ZyBhY2Nv
dW50aW5nIG1hdGNoZWQgY2FwYWNpdHktc2NhbGVkIGV4cGVjdGF0aW9uc1xuIik7CisJcmV0
ID0gRExfVEVTVF9QQVNTOworCitjbGVhbnVwOgorCWZvciAoaSA9IDA7IGkgPCBzdGFydGVk
OyBpKyspIHsKKwkJaWYgKHBpZHMgJiYgcGlkc1tpXSA+IDApCisJCQlkbF9jbGVhbnVwX2Nw
dWhvZyhwaWRzW2ldKTsKKwl9CisKKwlpZiAoY3B1X29mZmxpbmVkKSB7CisJCWlmIChkbF9j
cHVfb25saW5lKGhvdHBsdWdfY3B1KSA8IDApCisJCQlwcmludGYoIiAgV0FSTjogRmFpbGVk
IHRvIHJlc3RvcmUgQ1BVICVkIG9ubGluZTogJXNcbiIsCisJCQkgICAgICAgaG90cGx1Z19j
cHUsIHN0cmVycm9yKGVycm5vKSk7CisJCWVsc2UKKwkJCWJ3X3dhaXRfY3B1X3N0YXRlKGhv
dHBsdWdfY3B1LCAxLCA1MDAwKTsKKwl9CisKKwlmcmVlKHBpZHMpOworCXJldHVybiByZXQ7
Cit9CisKK3N0YXRpYyBzdHJ1Y3QgZGxfdGVzdCB0ZXN0X2JhbmR3aWR0aF9ob3RwbHVnX2Fj
Y291bnRpbmcgPSB7CisJLm5hbWUgPSAiYmFuZHdpZHRoX2hvdHBsdWdfYWNjb3VudGluZyIs
CisJLmRlc2NyaXB0aW9uID0gIlZlcmlmeSBjYXBhY2l0eS1zY2FsZWQgYmFuZHdpZHRoIGFj
Y291bnRpbmcgYWNyb3NzIENQVSBob3RwbHVnIiwKKwkucnVuID0gdGVzdF9iYW5kd2lkdGhf
aG90cGx1Z19hY2NvdW50aW5nX3J1biwKK307CitSRUdJU1RFUl9ETF9URVNUKCZ0ZXN0X2Jh
bmR3aWR0aF9ob3RwbHVnX2FjY291bnRpbmcpOwotLSAKMi4zNC4xCgo=

--------------GMXuTZTbAfWY57eKYcml8xdB--

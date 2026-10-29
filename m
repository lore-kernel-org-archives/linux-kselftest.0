Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793275249;
	b=Awiyv5k2SSCnzaev3s7aqT3/PQZeQs4+ht/fjBBD4eHwac8GxAgefcHP2fUjFsW1RGKJ
	 oMcPtw3lsq0vxij/5c/ph+QYwI2RfBP1jPtJ5Luj5pt0V5gDp6P/VvM1gfWUDIKcQFcL/
	 1EGr7txMxyiZOk8klIrghvwyKZpduwd5Bvhi7iGPduk0MNlOyxNQEHS8WZfhPrq5M1gnL
	 LoHt/hGAesYkAxWqjAeSNlMAhvVEG+o8XgJ1fohNosfCkjsQfb9mK17zjcsvOCPfjeBK5
	 k0pEBsKGL9nr7WdiAmvj57czhls5eKZ1L/1pzMzEC5dIx13qAmrkJCUxLs1x58npplQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Mime-Version:X-Original-From:User-Agent:From:In-Reply-To:
	 References:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
	b=Y5qUsKmjYWEG/A8GoG+Mb9adzGYfd0xrLNic0eJe7tLKRNHxVFliXlKdluxXnqR8cr8O
	 6ltUSgF5gAyw/dFU32Ga7Cw34HR8VkaOkvZ4JdraUkqt4LqflRS4TcCD13Q5zrwiOXNqa
	 ZbMLA0399IqB7agCoR/yJj5BtOh2dOKCQFBVUE352nNXWyawSTr9gqjJk20WINDFm8+ca
	 TaCeHYWRAGk9BwuLLqFKYnu8FJznMZtnXgYVF53FA0RRCNVIkrfoj+t32x2uxO6moIEun
	 nojXMoX2Q2WCjWlsFCw7Q4UhjROA4T0LWs66oASCeEPNO0U0Tps8CQW6mv0836GH/Jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DPz8UE+T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BB8606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 12:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65BB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DPz8UE+T
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc346401aso1425865e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 05:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793275246; cv=none;
        d=google.com; s=arc-20260327;
        b=V9CTlbd1gq8Btwmnz/jft9ovAg40ZBagdr/Za3bCoK+2YTiagncg4Sy3lOpmlIiUGO
         8FNsJHiOJnS4yhvZK2SKOUX7DQ6ofGkPqZocKDSsQAeohufTulsyd8q5LtSJtM3GDG2R
         hUez1EClDhX5hic5Awy6m7yWeZvACMn/R/ueZ/CVXMBEzhg/10b3xyJEm0g6hDp5+S19
         gIlWRNrKGiptrL3gXn1EQawU1ML0EarZHJfkjLMUyPYV+T6FYFXIkzN8aEsb8iEr+N0d
         7niRQFk/1ovx+JyFblE61evROj6cRc26IpMVN/kXPJ6gVnb7SwbX41udpPOFj3IwK+RP
         iNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:user-agent:mime-version:dkim-signature;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        fh=Fh5U7cDP3NY/U/xg5OMSDwHTj1hY1GgkWSSJDYt31x4=;
        b=RIMn7xtrSwh4GzWYxduxG8vG3l4vGOVSADshMsy6Q3ezs/EDQd4mQHgB3aeUHwGCw4
         AQAIFUuoA3j3riLsunAEXD/ghiJuesLGIahiG+aiY0aDNQlELwOWQj1RIyAW5hzGRr7q
         deTW+6Mu2E3746c08NQOGIcETCfMa04+/14SlgKYaORHcdc8xeisa2NIzWFhYKSxaC/f
         y3NHoz88JWo/hUgGKGjLIFW0uZo4TVdQJy3vwLr93X8wythofHeJfpV7mPrP5U43a5+r
         xcZGloxy/gWMhC2a2+5gGb9xk9W1WtTwjMXT3BNhlezmPJWyD9TTsQFppEvGiuc01MH/
         vUMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793275246; x=1793880046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=DPz8UE+Tyq/cYPEl4w9kY6RF8oUPSIePH2cHsTWTsyIww8cgzD+L4D6RUw7K7cWW8o
         5bT6/92MEzA94ZSo9BosrD4q/8jYMsNjrBbEJbcait+RXDxiIjBHhTsmvsq8563TjuoW
         v1ABBvVvDyu9Gu32MGKQvkCCIy5rvYW/syrlIQuko6y/kiNEMf+iNoL28ME+J/WphOGq
         yZbm9hNqjWElPQXS2RMtV9pPlxKbl14jwd/SAR7ig0ALG3rhefYwqE+XXPLp9xRw6ZJO
         S20d4XV4bJLSlIKAqfLFe9CMRHcOH7RmLI/OjGvEGB8AqZUUPG9kp+rQGEEtoQPZGtlR
         IMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275246; x=1793880046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=pVrJbSIAsO0Ecs2iDo0vqbiCgTn2QquCZvXELSzDTDhKyA575Zr86mkSY4Iqn2FZaY
         OmPIDBICuze1BalX7r+jXrOsPYMx43/ruexh4tEusgKiG7tCUe3sBasm8JBY9wCsoUg3
         yBi/0ksuxilOycqXWokf0EaJ1fr462vgCcJjHV9J7Iu7qikPPYGDTR64299KeQptYmwB
         lM/DTwPfWNV9XRfjzmtFb1FVuGS7j+Kl1yA/K/m1uNPq+v3h65t7nLtnr4RF3mATpW4Q
         Yuo4ZbkLAGQGOqukox+Sxm3Ky//jnvJFs7oAdiuCJREyl9OdsXdbagR3mIl53l7/aKza
         YSUg==
X-Forwarded-Encrypted: i=1; AKwUvBw1HTqksUClU7bqhsHUf1g9QtLbG26xQxL6Kf8sCz5toJQaiUbSMSYSA9NrudZ7rX1iuCyTEV9dDYJb8ECmGJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6V5f9zSaiWkLPOisM5mj7M9OyKec1WdztG9OFOD3W+C9nK1CP
	JQGssgK+gorAB23H3cnSCmmNeRRLrW9z3kwaR9k2jjz8Ka1VvD0JdP1FUn4BsZCPG6NK1QbGuFj
	DWJrDKcdSfd+t8Rb9g0y7vMVddq+zf5JDzKB6zijt0A==
X-Gm-Gg: AYBFou36hz2ZTwzHnOYskEXbNt4X2V4WRGrI+/VIGi9+xRXbr4aCCP09xXTqc4AEKtb
	i/msVLSGjH6MRNWs1wYCUNIyKUdVvgpbWuVSShmrFOmsQ9wgasB2ISDkQbPGLp7IYHwt4ou8XkT
	RutA1F6ls2IWljJK8VKdE365zEH8NpPZbDOcs71XBTSq4FoOh2mmuorBm+bJbZZKenId1OnAKd0
	ToiTZEs4nAm0H3C1dq5K2dtnwPzHfYuZTDTQahGhBRQwHmNKhkKez7lViCJ4N54+TgViP6KY3gj
	4GySAOuUlF3XULWqcuy9hfyYcfogFBKevFI06Uk70nlULecIbt9PdWHLhFQTuKRqJ4TzQtHVcKD
	CbPSCwxGfawBAKeYjNOm30zQ6tdIZVR09lePt0A==
X-Received: by 2002:a05:6512:340d:b0:5bf:d653:ff01 with SMTP id
 2adb3069b0e04-5bfd6540187mr229252e87.34.1793275246438; Thu, 29 Oct 2026
 05:00:46 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com> <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 07:00:45 -0500
X-Gm-Features: AclHuK_sbU548xic3ZPbWuif9uJX5ACTcms_1cHQ__pmhhaKq4RoduWrhke4WpA
Message-ID: <CACnXVnc0jFcNn0bmU5MSm81QTm6Ht+deSRED=91dViZnq1dNmQ@mail.gmail.com>
Subject: Re: [PATCH v12 03/11] riscv: sse: mask events during shutdown and kexec
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Himanshu,

On 10/29/26 7:49 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 03:48:45PM +0800, Zhanpeng Zhang wrote:
>> SSE delivery is independent of normal S-mode interrupts. Firmware may al=
so
>> retain an event registration until Linux explicitly unregisters it. A ha=
rt
>> must therefore stop accepting SSE events before Linux stops servicing th=
e
>> registered handler.
>>
>> Mask SSE on the local hart before panic stop, CPU stop, restart, powerof=
f,
>> and crash shutdown paths. This prevents firmware from entering Linux-own=
ed
>> handler state after the corresponding CPU or kernel context is no longer
>> valid.
>>
>> A crash kernel cannot identify or take ownership of registrations
>> inherited from the crashed kernel. Reject a later normal kexec while suc=
h
>> SSE state may still exist, rather than transferring unknown firmware sta=
te
>> to another kernel.
>>
>> The restriction is deliberately based on firmware SSE availability, not
>> CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disablin=
g
>> SSE in the crash kernel does not establish that registrations left by th=
e
>> crashed kernel are absent. Consequently, normal kexec from a crash kerne=
l
>> is also rejected when firmware advertises SSE but no registrations were
>> actually left behind. This conservative restriction remains until a safe
>> way to establish or clear inherited firmware state is available.
>>
>> Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm=
.com/
>> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>>   arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>>   arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machi=
ne_kexec.c
>> index 738df176ff6..24e7affae70 100644
>> --- a/arch/riscv/kernel/machine_kexec.c
>> +++ b/arch/riscv/kernel/machine_kexec.c
>> @@ -14,10 +14,13 @@
>>   #include <asm/set_memory.h>	/* For set_memory_x() */
>>   #include <linux/compiler.h>	/* For unreachable() */
>>   #include <linux/cpu.h>		/* For cpu_down() */
>> +#include <linux/crash_dump.h>
>>   #include <linux/reboot.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/irq.h>
>>
>> +#include <asm/sse.h>
>> +
>>   /*
>>    * machine_kexec_prepare - Initialize kexec
>>    *
>> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>>   	unsigned int control_code_buffer_sz =3D 0;
>>   	int i =3D 0;
>>
>> +	/* A crash kernel cannot tear down registrations inherited from firmwa=
re. */
>> +	if (is_kdump_kernel() && image->type !=3D KEXEC_TYPE_CRASH &&
>> +	    riscv_sse_available()) {
>> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
>> +		return -EOPNOTSUPP;
>
> I think I had pointed this out in v10 also. This rejects a normal kexec f=
rom any kdump kernel whenever firmware merely advertises SSE, regardless of=
 CONFIG_RISCV_SBI_SSE or whether anything is registered. Can you check if i=
ts breaking kexec() with SSE just being advertised?
>
> Regards
> Himanshu

Thanks for following up. Yes, the current check rejects that case based
on firmware advertising SSE alone. I noted this restriction in the
commit message, but it still needs to be narrowed.

With the merge window closing, I kept that change out of v12 and will
address it in a separate follow-up patch like we discussed.

Thanks,
Zhanpeng

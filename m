Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274583;
	b=s87uBKkt24FE6vXD85Au++opwQ/AsdDLzeQboa2YLkz0eP8Q/wouQavNa/Ob2RL1ORjs
	 +qHUdVlJ3f+DptshjlWBA2Pq9C1b3YUI5UbUWLUZWwdXh5MCTiyflgHmNxGviv3Umhv6+
	 ZEMm1ioMbeTjx+9XU/I8+33keZ/kTrtWT/jKrpkjTkNLFF/kEp7k2qLAw+YQjcjJql1lx
	 OTSC40yiQoLgl5n2RwH9dQSZJ9YzuH1RhYOKT4F7MtVn7dWCoZnOS0LzgH2edlltF8v3R
	 MdNUSby4Pvq7hnw0KybIdGQFf3ANcmwsb7/pS/h+j/lvK5nRJNvPxZ2/VOzcGP25VXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CnD9Bbx1mXxdyDGDWNvR0ef0iRlpiPdONHzOZK+2clg=;
	b=GLU37AWRSd+MAnkGh5PlDZK5rbbOU662AEVW2z+8qN+bsixaJixHKXMjCJd6B25uCLFq
	 /r55B88N7GoC1Yfv4CsMko3viPFDaTfDF6zbHTVfzcLDiUzllTKbmmcPsnnOpBSzq54eJ
	 lNCixRR+NAGywaBiBkvRN1QkvrJoRdPLwFUN8tsf1ihsrpBs27CHnmt+C22K0UVSS9CqF
	 hOd2c5rUk7Idx+6DtYfoAOolR0FRDtCKKxE17m+HFPsa/LT1K6W/co/7cLMbmphD02e1U
	 NFKhJQTCS99NmKoQT4+QaerIrnOD47cvzfU+zAGWl1mTthedS3U3Hm8Ql9oYggzUhYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTBGL1w+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dclypbx/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E08606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E08606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTBGL1w+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dclypbx/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vUtg179449
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CnD9Bbx1mXxdyDGDWNvR0ef0
	iRlpiPdONHzOZK+2clg=; b=NTBGL1w+LQ9lMZJioMX9Fp9L3e2sNR/scON+RaeN
	STps0tqVzMHp1Ae2gO4tTv1V7S4QmiYU9g1B1Vrsmbly190GW8H1nn8D7wh4OARp
	k6tkJPPPyQ44ok9hzhYPSI65vZ/zkLZhV2JSVLlf4JdSNH97OK4z32pVx0WTRoGx
	DseJ1qt0wTRcRTwg2H3fseezhu+3A3/K1Zpa1uMo994q2BCUGjlEqC60nKo4yUev
	HVKMhrStF/sqPT70b6W+jo4ZtcvCfyNE5WsRiNABaP1DIZ5uVicXxSX0TeCKfryA
	uC6O5hn3uD1N8chgf2bgk/vkhAY4xiHcKX5nUZWCvXLzcw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc3cq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:49:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso2365776eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793274580; x=1793879380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnD9Bbx1mXxdyDGDWNvR0ef0iRlpiPdONHzOZK+2clg=;
        b=dclypbx/Ue1nWFbDFrJkalgpnu1ZY/gDAEatPkoR8cLxVL8gbiUwJlW6DtRKkkbB81
         8S2NSc/kS2aDq16RRQmE67F4BZ/L5dhYUxVHObCz15FAgZ8tSqEw18HmX2CF7slNp2ym
         aoakAUoyoNDDHIzALgIWYDWmmen6yYvjA10pJXWnWW40O1TwcG+ubzSZF+XAbIwVhk2Y
         Cul4FbRLcC/oYLa/lZkPuQaJMXwF/gvO58RvNJh7hh8GDEChE5k0WLoEup61EkZT8H8g
         BomNy3C35C+fgggwjcsFEuVASS/X413785W9ImrjW+9vxuzkCQr2NTtVH8QdUrf30aKc
         I1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274580; x=1793879380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnD9Bbx1mXxdyDGDWNvR0ef0iRlpiPdONHzOZK+2clg=;
        b=QkFQ7I1dW9sxtN9uORgACZKRGNxrXvSV0MnsFKj9pPg9XlfzcdfWLAK9eizh33BY/y
         +iBK30plktOxyMtRV9DVe5j9CeoVLH3cOkdJp/BMjmQW1RtZidgfFxSEyKIIeseuKR9R
         5RHW4Z1w6xLpZ0PLo1Br6Si9GJ35oLDEA9uLs+Vlpj52xYaXyj9opF6UARj/+kGNakNl
         DeplB9SZmkkw0BAnrmfqWu5EONH1XrOhd/gFLeM8KIHyMgkc53GTLTtu87/jDEMqFhJn
         sAwUmlk71Y/cc/HzPXT4urgzXsueFRy1hKeyHLAgSDaCdh50oPsxOwVDhz7PJJ95tt0d
         coag==
X-Forwarded-Encrypted: i=1; AKwUvBwzpFoLR+RnqI3FsSZ/2rl9szTzAlADFVpTQGApMEyVakyfr6TcKA/ijstPKan+mGt7tLSHiueVsu5OSFp3VMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPIf2wzVSlsf6P8X9UoPL0dZIH2K36vULvf+UdZ68Z0doQN3jo
	WIfTu4PjY7DGw5oW6/bTW93+YKAYSzHTCDfPNDjOnzxRsVng+ADg/dQLylxcCxWStjPkQsgH8+s
	Lo5AF4pfn5S+A58BSzPMC1KTmRTTgOHuEee+bRUW5Wo3Zx8znBi75ZE3Ni0QvkXXk175M2Vk=
X-Gm-Gg: AYBFou1I2HFR3a/gqUT4+KnMb6bAnvJ3FQKiJIODjepATPZxHDET9ZBJyfgJKlRF/lN
	nSNqCszFiPbhkud5qze/GvdW6fSNxiSsCtlMLOZkc2+3gfrWZvcIFTFzcEKUOkEt9RWUc9ZQ5f0
	ZOBYEFuc461AeL70uOEgZPQInis3ojCygUZPTmpuA45oI4ON8wgtjrzOgu9eISpdsiOnNhKKFBA
	wxV8vGZ46zArIMIKHisPG5E3ywd1BW1aT4NkvB1FCxg36APetyspfW6zoJQ2gw048YBcJcrZtgy
	4w/jlClFVeatlLHqK7zlcNoRzhtkEOhwYqFzh5F2pscHR081tWDL5BXVOldQfif2jfCS6/QfteA
	6i3GSzn8FDwOWEuezYYlm5/YN74YOzrtwxDzQ4gAO0hAwFmNqHQLk+sy4pajq40C+K66UB00lgU
	MvuPZ/smvKI6O9EWSELmBwTex41AP9xeUQNBGkPOMqR2TAofIDeKF1fj+L1E0lvb+8gZL7hx/t
X-Received: by 2002:a05:701b:270f:b0:128:d4be:7428 with SMTP id a92af1059eb24-1a6ce4ea644mr7017480c88.19.1793274580132;
        Thu, 29 Oct 2026 04:49:40 -0700 (PDT)
X-Received: by 2002:a05:701b:270f:b0:128:d4be:7428 with SMTP id a92af1059eb24-1a6ce4ea644mr7017432c88.19.1793274579516;
        Thu, 29 Oct 2026 04:49:39 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a5594efsm19594399c88.2.2026.10.29.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:49:38 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:19:27 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        yuanzhu@bytedance.com, yang.yicong@picoheart.com,
        yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v12 03/11] riscv: sse: mask events during shutdown and
 kexec
Message-ID: <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae332d5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=d9ZL6iGcv7SM8b05mYgA:9
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: QoEYWwK_GD0mhb_S7Zjk-nH4CVeQEhnj
X-Proofpoint-ORIG-GUID: QoEYWwK_GD0mhb_S7Zjk-nH4CVeQEhnj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX/l6y62TTU6Zq
 FyXSduWTOMxNZD5O1SFwO1C48ZzUuFqgCDXUiAIftpQzeap1pySRJ18MkPZSPphgdVkuAJroNz/
 3sKezX4MMjf24tfG39/6U+WWmRgGtU+uCQf3+vV9QKoMDUoPs2MqlaHSt4ahMOwujHVwvInKuIm
 mxB7kVaR10g7AWcxxedAJC8LclXevg68HVRt4nosgSy1dXBRhqXLXIIBGh8SSax1uM9kpNH3Aef
 19DXGwe54GZpe2ChCjYspJMDUZg4O31ZRvIyQRE0p8RuXSFdJPP4NyAGZntFWiEZBMWA9NS76M2
 is5iRiSgdOh+h1cQanIRLWXYFBAkhT8r201xH2m/jkYTbmAH7JCZyUeXhw7uu6mobyBkhAMyy4F
 4xTC1SCBwdBww3CnKFBG7/xkyI92CqSdlkQ90XOlN4UU+CQWqPEL/6iebYOZSCnQk2uxuA+a9C4
 dzoeceSxiPGSAs/e9Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX5YRgg95uFHhf
 lFykFbZDRnnKb4Whz96CjPDjHybe439mh3Ic2gyxERfKNOZFrAwZMfRTskyARZxS5zmuR32aWw5
 hNm6BiW9RfkfKjca9WEtdEw/+kwpSus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045

On Thu, Oct 29, 2026 at 03:48:45PM +0800, Zhanpeng Zhang wrote:
> SSE delivery is independent of normal S-mode interrupts. Firmware may also
> retain an event registration until Linux explicitly unregisters it. A hart
> must therefore stop accepting SSE events before Linux stops servicing the
> registered handler.
> 
> Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
> and crash shutdown paths. This prevents firmware from entering Linux-owned
> handler state after the corresponding CPU or kernel context is no longer
> valid.
> 
> A crash kernel cannot identify or take ownership of registrations
> inherited from the crashed kernel. Reject a later normal kexec while such
> SSE state may still exist, rather than transferring unknown firmware state
> to another kernel.
> 
> The restriction is deliberately based on firmware SSE availability, not
> CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disabling
> SSE in the crash kernel does not establish that registrations left by the
> crashed kernel are absent. Consequently, normal kexec from a crash kernel
> is also rejected when firmware advertises SSE but no registrations were
> actually left behind. This conservative restriction remains until a safe
> way to establish or clear inherited firmware state is available.
> 
> Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com/
> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>  arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 738df176ff6..24e7affae70 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -14,10 +14,13 @@
>  #include <asm/set_memory.h>	/* For set_memory_x() */
>  #include <linux/compiler.h>	/* For unreachable() */
>  #include <linux/cpu.h>		/* For cpu_down() */
> +#include <linux/crash_dump.h>
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  
> +#include <asm/sse.h>
> +
>  /*
>   * machine_kexec_prepare - Initialize kexec
>   *
> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>  	unsigned int control_code_buffer_sz = 0;
>  	int i = 0;
>  
> +	/* A crash kernel cannot tear down registrations inherited from firmware. */
> +	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
> +	    riscv_sse_available()) {
> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
> +		return -EOPNOTSUPP;

I think I had pointed this out in v10 also. This rejects a normal kexec from any kdump kernel whenever firmware merely advertises SSE, regardless of CONFIG_RISCV_SBI_SSE or whether anything is registered. Can you check if its breaking kexec() with SSE just being advertised?

Regards
Himanshu

> +	}
> +
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i = 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <= sizeof(fdt))
> @@ -127,6 +137,7 @@ void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> +	riscv_sse_mask_current_hart();
>  
>  	/* shutdown non-crashing cpus */
>  	crash_smp_send_stop();
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 14eb08a6db8..fdab37e7ae5 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -6,6 +6,20 @@
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
> +
> +#include <asm/sse.h>
> +
> +#ifndef CONFIG_SMP
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +#endif
>  
>  static void __noreturn default_power_off(void)
>  {
> @@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	riscv_sse_mask_current_hart();
> +
>  	/*
>  	 * UpdateCapsule() depends on the system being reset via ResetSystem().
>  	 */
> @@ -30,12 +46,14 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index eddbc3ad06c..9ad38df4827 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -22,10 +22,13 @@
>  #include <linux/irq.h>
>  #include <linux/irq_work.h>
>  #include <linux/nmi.h>
> +#include <linux/panic.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  
>  enum ipi_message_type {
>  	IPI_RESCHEDULE,
> @@ -78,8 +81,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
>  	return -ENOENT;
>  }
>  
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +
>  static void ipi_stop(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	set_cpu_online(smp_processor_id(), false);
>  	while (1)
>  		wait_for_interrupt();
> @@ -90,6 +103,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>  
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
> +	riscv_sse_mask_current_hart();
>  	crash_save_cpu(regs, cpu);
>  
>  	atomic_dec(&waiting_for_crash_ipi);
> @@ -253,6 +267,8 @@ void smp_send_stop(void)
>  {
>  	unsigned long timeout;
>  
> +	riscv_sse_mask_current_hart();
> +
>  	if (num_online_cpus() > 1) {
>  		cpumask_t mask;
>  
> @@ -300,6 +316,7 @@ void crash_smp_send_stop(void)
>  		return;
>  
>  	cpus_stopped = 1;
> +	riscv_sse_mask_current_hart();
>  
>  	/*
>  	 * If this cpu is the only one alive at this point in time, online or
> -- 
> 2.50.1 (Apple Git-155)
> 

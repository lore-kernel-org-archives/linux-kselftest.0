Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281723;
	b=ZbC+VmoKcu0zLIPtD7w84+glL58wKyRjptTZvpU2UsOgre+Nu2TvM2+/UpncZYirLcg0
	 2uJ/ASi4s7OYdB2YGSe8KdaayhxFu6StCbjcwYl4A25VhRLPxH1ZH8xEfo/+NhdtuvI/L
	 sT5VtwkofhmxTILcKxSiGrrk1+t0j3LuoBGiLO1GRI6v6l4vycM/qfmLVq7YVOUa0Azxh
	 IqtQ3891Zdy2qg8BsJWHQ60H0caqarr55xSHl1p2UyHzh2gZvhjhxvzJqqzaGUdQzl+Lz
	 5+sxThGeeMnvcOT1rHraAyGqO7sHlkZy4ZN+Rg8VP+kxr3ofERPsta7lBTF6jJOgLSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yKUb+e+r1u2t8HJphqLrfWh8YuSOoTf03+OUgLGZyP0=;
	b=ElDFWhx6NDNgk29n30S9a7SMgx6QBmG8/I/poso9slit5yyD0MAAGsJgOxJm1MPc0ssm
	 DEh/D2e8C2wZ8nZG2w9UMWdEb+CmlB8Wm9Fjq29B6FAaDjJcc4NvMciB2cD9UzObrgntk
	 nZfhu/hsiUi3ISC64eb/xG86awrHNQbVKDS8MpQF4aBV2POlXvlIt3+mE1eXalEIE/IIX
	 J+gasJXtyAPO0RVEqRgwiKOZJeo9AaMrBhJFZsSoTyEfwqfiUSW9rc2xk0sTCsF7oxmaJ
	 OrwCNvuFg4N6Uvi/3OHDwFX73mG3UsX/EN1lByCzm/Ii8rdJY83mGhfghKiCNEl62ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XxZE4kBP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6SexwGt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5160A381E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A5160A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XxZE4kBP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6SexwGt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdx663767934
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKUb+e+r1u2t8HJphqLrfWh8YuSOoTf03+OUgLGZyP0=; b=XxZE4kBPU+SCS1D6
	v9gtxE3K/AhQdeuOsh23EtQy8zWtUsBZzT1fxX4AXOI7nFHgrVGx4UjxX7oTrabj
	IWXNsq36PL4n/IzNAQLFNSGYkSSqYjb42SF6NPgshggpTDMOnCzLBtWdXMg8vzDU
	2F+zSqxZ/Yj6TPsqsAyV6iPhwWLeHtP+1bCVx9gEgHU6us/RXOyRGiYu0U8n41kx
	ACYL78rb0mH71euTbcRpTvjhCY07QJw+FKB7l+RMLP3FDxYB5PyxbrzTx+hlbFJC
	ARcd8wPYoVVaFsyHvBlxe+QR2lZyuy75CTYIbJuDlN0aGwVwYVDZH8Yr6mZDP957
	LvHNmw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3nb85r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:48:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so988496eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793281721; x=1793886521; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKUb+e+r1u2t8HJphqLrfWh8YuSOoTf03+OUgLGZyP0=;
        b=K6SexwGtIZZYceigjSw8xAhVrpdJ0RzIUh09o+p162t0iQAA8X/Vgq/+K8lUjX2xF0
         NXnw7+BJHKem1nOWuIDFTovpmWUvpb7qeG8qSF+tiBQGoKb0T4lUYx5oZ/suTlSnqZ6L
         a+jZLevQUooTl1+MiHq/QvzDuch0JLukaBZeRqLFHXrOxK3h0K1Lod8K8T/O+4oZ9GZk
         3LrET3kkcQ7ho6s/o0Bh7rKPCHMXOr80S1peS9wsdT+rgL2RxWB6E3LBgySfHxUKl1ud
         QkoLhX1D8vz6xXOfgXMCJO+y7sJiYiOnTx3O4kMfb9cnt2f6EmB8qzkZu2RM2d6z0aPj
         8GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281721; x=1793886521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yKUb+e+r1u2t8HJphqLrfWh8YuSOoTf03+OUgLGZyP0=;
        b=pUzzavZCmIUoU6PNbV67G2qBh5QYlv7/6ceoBmaVg328XxlfqPdcbtd6cvOqShOZLV
         c/TWnMVNCmNwAzqSxSWnph8kEWu69qv61JAu1wdwGF4D6KmUcEbssQBtwudLvTSO/AjQ
         HL+u70kP/mjfcBKb9W2Dx8sv27/4LWvF8/omEff7qypPu/GDQWdHwiE5o5vDLtyXkHJv
         eStd9dKaJtwOmvx4sM/n1msgwhf6xmbwmjsN5YK60693BRqogqVWOlvP4qYrxBS3hSbR
         GaUwB7OjdXeag++ofOCWHzML72/4aR3rMgAA4NRDABApnurp8JN9bJqP9g59q3e+d6BY
         vv1g==
X-Forwarded-Encrypted: i=1; AKwUvByWL1M3K5qz8kTwztsOay4XwOkp1ptsP/YOOXEqhZsl/pnYDrBIasO4afnKprdcdf5UT6PgJgFgN8lu4V4FfGA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhoyC/qxIJPIbhvh9caSmnF5Q+IPvkxLBxA5a7BzxAmuZmcfVG
	S1I/jvjMG54tMCt89rcJg7ZC/qPm/y0DKVubzd8KrZsYPR24/zhdR2ni+G+q2bqg9duQ2c3llSy
	tGmbPulDccWfbUgznJWYytUn5zExX3xelcyBWymajt59yYdhK439plCIHH4YjXddB+sDIRk4=
X-Gm-Gg: AYBFou0ODMLu/gBGKjuzNZn1PMojbLYrpJXnlvLdbhMqM9l+gX2rJQ8nl+pKQUW4saa
	toHeVuAE7DnvAICs3RSNkk3RyH9CShmHHCF9Tq3tysLT0oOqmgpyWnlcAxuRGsDiQY4K1D8psYh
	wQfX/JqsaWaME7KdqJaDmzl8VQ3FVTUVJMC0BhHGI/we3gUt2NKoixzeeCrNRKTGsddwEyZD4Tz
	IP7miLOvuAVuMl44jkWWHBbGyQJ94mP1WNVoArNdKW9XnjZXD78rED1V9uaeiZx70z7XMjNR8HA
	4QPjF/S2BvnTR3Rz9ntXE12JVGg439fjGFu0Avoo5Lh9pmEM6SBp6EmoDj9dpc2uU3GJES3tfLH
	9j4BM94ISLxNkotH12kEddeWLWhDBJCq7Xb1TZNTbU74scGn/MM8+WaouV7ecPRysQbF7FVKzdT
	Ag2XgCBkF5TZLjJjIwRayRONiGOeCCB3WrK6nZddrjsD6M0N55K700VqcfYyMZYs789+kz586nM
	g==
X-Received: by 2002:a05:701b:281b:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1a6ced8ff93mr7225096c88.12.1793281720254;
        Thu, 29 Oct 2026 06:48:40 -0700 (PDT)
X-Received: by 2002:a05:701b:281b:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1a6ced8ff93mr7225025c88.12.1793281719242;
        Thu, 29 Oct 2026 06:48:39 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e0098basm14561166c88.12.2026.10.29.06.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:37 -0700 (PDT)
Date: Thu, 29 Oct 2026 19:18:25 +0530
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
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v12 02/11] riscv: add support for SBI Supervisor Software
 Events extension
Message-ID: <auNOqR9xm3XMJcFN@hu-himchau-blr.qualcomm.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-3-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029074853.35467-3-zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-ORIG-GUID: kCzCR0o-fr9ujSSQFBbZGnv7iGUl3nqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX4kM9xx9Y7Bgr
 9qpzd+nzXwD1jIP9vhfOqitu7hOWrdTHhrcsNkW7Ci9m8G1clAr5SSIe5BK4EGng09VnG6KGi+V
 +F09Rj4spOI/IeyLb1gpEJpRcmeE9gNpjDPIIQytQKGZjBgx85HrkfaI4YuVbF5grzJSf2TFHN1
 LZF228MBXoDob+d4iW+C3e1wlPlptCei72QUwYXquwqjRYPzk2txRe+8vRzvahttILNC7t9a5zo
 RFlPq7S0duPUIeCgWB7io3qdHJm9jry+mBUvFZFaFUMlS4nuc0rHzkn/1u7B20Qh1sFLCFpfIPB
 Ez86t3Y9RtRjfYJX+Z11PHDSZBk+7IFx1aS9Z6JuF3x21FqAFjZs4J6QGMobOXTFCWoHJh3hkSw
 B9kF5Ka3cqIKiUvy/ZKLTi+igGt8lhvKD07n4h6FST0QzEvimi7ugAFbBSmhW24AkHJcTCZNxbc
 rAopo3uBUqsUG/rholA==
X-Proofpoint-GUID: kCzCR0o-fr9ujSSQFBbZGnv7iGUl3nqa
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae34eb9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=h0uksLzaAAAA:8
 a=968KyxNXAAAA:8 a=tdrQ5JWFJrfNoi6SxCYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXwIqpClgQ+AIM
 +6JvadZEKq77uDb2Gpm0Bta6zyoFvi5yMHzNW1mk1xjoY94RZzOrSG2pGzge7jWPKmDk8cMR5cf
 A0dnTOLLeY+XBmI++uROYH44vrP0Cwk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

Hi,

On Thu, Oct 29, 2026 at 03:48:44PM +0800, Zhanpeng Zhang wrote:
> From: Clément Léger <cleger@rivosinc.com>
> 
> The SBI SSE extension allows firmware to notify supervisor software of
> events that must be delivered independently of normal S-mode interrupts.
> Firmware saves the minimal state required to enter the supervisor handler,
> and Linux builds the synthetic handler context around it.
> 
> SSE can arrive while Linux is already in an exception entry path. At that
> point sscratch and tp may be in the middle of the normal trap-entry
> exchange, so they cannot always identify current. Store current in a
> per-CPU slot and use the hart ID passed by firmware to recover it.
> 
> Give each event, including each CPU instance of a local event, a dedicated
> stack and shadow call stack. Synchronize vmapped stack ranges before
> unmasking events so that the handler cannot take a vmalloc fault while
> running in an NMI-like context.
> 
> The handler is a synthetic supervisor episode, but completion must resume
> the context interrupted by the SSE. Preserve stvec and, when the hypervisor
> extension is present, hstatus across the handler. Read the interrupted a6
> and a7 values from the SSE attributes, construct pt_regs for the
> interrupted context, and write back any changes made by the handler.
> 
> Nested exceptions on the SSE event stack temporarily replace both
> TASK_TI_KERNEL_SP and TASK_TI_USER_SP. Preserve their original values
> across the handler and restore them before completing the event, so a
> nested exception cannot leave the interrupted task referring to the event
> stack.
> 
> On RV64 with an MMU, early trap entry also uses thread_info.a0/a1/a2
> as scratch slots before saving the full register frame. An SSE handler
> can interrupt that window and take a nested fault which overwrites the
> same slots. Preserve them in already-saved callee-saved registers and
> restore them before resuming the interrupted entry path.
> 
> Disable preemption while initializing the per-CPU entry-task slot.
> CPU hotplug callbacks run in a preemptible thread, and this write
> happens before the guards around the local SBI operations.
> 
> Compile the stack TLB helper only for VMAP_STACK or SHADOW_CALL_STACK,
> its only users, to avoid an unused-function warning in other builds.
> 
> Keep an explicit EVENT_REGISTER not-supported result distinct from other
> firmware failures. This lets clients select another delivery mechanism
> only when firmware has positively rejected the requested event.
> 
> Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610020009.P3ILnDi1-lkp@intel.com/
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
> Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/include/asm/asm.h         |  14 +-
>  arch/riscv/include/asm/scs.h         |   7 +
>  arch/riscv/include/asm/sse.h         |  82 +++++++++
>  arch/riscv/include/asm/thread_info.h |   1 +
>  arch/riscv/kernel/Makefile           |   1 +
>  arch/riscv/kernel/asm-offsets.c      |  14 ++
>  arch/riscv/kernel/entry.S            |  14 ++
>  arch/riscv/kernel/sbi_sse.c          | 251 +++++++++++++++++++++++++++
>  arch/riscv/kernel/sbi_sse_entry.S    | 237 +++++++++++++++++++++++++
>  9 files changed, 618 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/include/asm/sse.h
>  create mode 100644 arch/riscv/kernel/sbi_sse.c
>  create mode 100644 arch/riscv/kernel/sbi_sse_entry.S
> 
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index b8bf842d4c1..e1196caea02 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -91,16 +91,24 @@
>  .endm
>  
>  #ifdef CONFIG_SMP
> -.macro asm_per_cpu dst sym tmp
> -	lw    \tmp, TASK_TI_CPU_NUM(tp)
> -	slli  \tmp, \tmp, RISCV_LGPTR
> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
> +	slli  \tmp, \cpu, RISCV_LGPTR
>  	la    \dst, __per_cpu_offset
>  	add   \dst, \dst, \tmp
>  	REG_L \tmp, 0(\dst)
>  	la    \dst, \sym
>  	add   \dst, \dst, \tmp
>  .endm
> +
> +.macro asm_per_cpu dst sym tmp
> +	lw \tmp, TASK_TI_CPU_NUM(tp)
> +	asm_per_cpu_with_cpu \dst \sym \tmp \tmp
> +.endm
>  #else /* CONFIG_SMP */
> +.macro asm_per_cpu_with_cpu dst sym tmp cpu
> +	la    \dst, \sym
> +.endm
> +
>  .macro asm_per_cpu dst sym tmp
>  	la    \dst, \sym
>  .endm
> diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
> index 023a412fe38..0d70a35bc01 100644
> --- a/arch/riscv/include/asm/scs.h
> +++ b/arch/riscv/include/asm/scs.h

This patch doesn't apply on v7.3-rc7. Did you rebase on it?
b4 shazam failed at this patch in scs.h file.

Please check.

Regards
Himanshu

> @@ -17,6 +17,11 @@
>  	load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
>  .endm
>  
> +/* Load the per-CPU IRQ shadow call stack to gp. */
> +.macro scs_load_sse_stack reg_evt
> +	REG_L gp, SSE_REG_EVT_SHADOW_STACK(\reg_evt)
> +.endm
> +
>  /* Load task_scs_sp(current) to gp. */
>  .macro scs_load_current
>  	REG_L	gp, TASK_TI_SCS_SP(tp)
> @@ -40,6 +45,8 @@
>  .endm
>  .macro scs_load_irq_stack tmp
>  .endm
> +.macro scs_load_sse_stack reg_evt
> +.endm
>  .macro scs_load_current
>  .endm
>  .macro scs_load_current_if_task_changed prev
> diff --git a/arch/riscv/include/asm/sse.h b/arch/riscv/include/asm/sse.h
> new file mode 100644
> index 00000000000..cbd8618c6e0
> --- /dev/null
> +++ b/arch/riscv/include/asm/sse.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +#ifndef __ASM_SSE_H
> +#define __ASM_SSE_H
> +
> +#include <linux/printk.h>
> +#include <linux/types.h>
> +
> +#include <asm/sbi.h>
> +
> +static inline bool riscv_sse_available(void)
> +{
> +#ifdef CONFIG_RISCV_SBI
> +	return sbi_probe_extension(SBI_EXT_SSE) > 0;
> +#else
> +	return false;
> +#endif
> +}
> +
> +static inline void riscv_sse_mask_current_hart(void)
> +{
> +#ifdef CONFIG_RISCV_SBI
> +	struct sbiret ret;
> +
> +	if (!riscv_sse_available())
> +		return;
> +
> +	ret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_HART_MASK, 0, 0, 0, 0, 0, 0);
> +	if (ret.error && ret.error != SBI_ERR_ALREADY_STOPPED)
> +		pr_emerg("SSE hart mask failed: %ld\n", ret.error);
> +#endif
> +}
> +
> +#ifdef CONFIG_RISCV_SBI_SSE
> +
> +struct sse_event_interrupted_state {
> +	unsigned long a6;
> +	unsigned long a7;
> +};
> +
> +struct sse_event_arch_data {
> +	void *stack;
> +	void *shadow_stack;
> +	unsigned long tmp;
> +	struct sse_event_interrupted_state *interrupted;
> +	phys_addr_t interrupted_phys;
> +	u32 evt_id;
> +	unsigned long hart_id;
> +	unsigned int cpu_id;
> +};
> +
> +struct riscv_sse_interrupted_context {
> +	struct pt_regs *regs;
> +	unsigned long hstatus;
> +};
> +
> +static inline bool sse_event_is_global(u32 evt)
> +{
> +	return !!(evt & SBI_SSE_EVENT_GLOBAL);
> +}
> +
> +void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int cpu);
> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id,
> +			int cpu);
> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt);
> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt);
> +void arch_sse_init_cpu(void);
> +
> +void sse_handle_event(struct sse_event_arch_data *arch_evt,
> +		      struct pt_regs *regs);
> +asmlinkage void handle_sse(void);
> +asmlinkage void noinstr do_sse(struct sse_event_arch_data *arch_evt,
> +			       struct pt_regs *regs, unsigned long hstatus);
> +
> +const struct riscv_sse_interrupted_context *
> +riscv_sse_get_interrupted_context(void);
> +
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 55019fdfa9e..d14b45610c7 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -36,6 +36,7 @@
>  #define OVERFLOW_STACK_SIZE     SZ_4K
>  
>  #define IRQ_STACK_SIZE		THREAD_SIZE
> +#define SSE_STACK_SIZE		THREAD_SIZE
>  
>  #ifndef __ASSEMBLER__
>  
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index f54c336bf54..0728362ba0a 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
>  obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
>  obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
> +obj-$(CONFIG_RISCV_SBI_SSE)	+= sbi_sse.o sbi_sse_entry.o
>  ifeq ($(CONFIG_RISCV_SBI), y)
>  obj-$(CONFIG_SMP)		+= sbi-ipi.o
>  obj-$(CONFIG_SMP) += cpu_ops_sbi.o
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index a75f0cfea1e..15363703cdd 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -15,6 +15,8 @@
>  #include <asm/ptrace.h>
>  #include <asm/cpu_ops_sbi.h>
>  #include <asm/stacktrace.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  #include <asm/suspend.h>
>  
>  void asm_offsets(void);
> @@ -533,6 +535,18 @@ void asm_offsets(void)
>  	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
>  	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
>  #endif
> +
> +#ifdef CONFIG_RISCV_SBI_SSE
> +	OFFSET(SSE_REG_EVT_STACK, sse_event_arch_data, stack);
> +	OFFSET(SSE_REG_EVT_SHADOW_STACK, sse_event_arch_data, shadow_stack);
> +	OFFSET(SSE_REG_EVT_TMP, sse_event_arch_data, tmp);
> +	OFFSET(SSE_REG_HART_ID, sse_event_arch_data, hart_id);
> +	OFFSET(SSE_REG_CPU_ID, sse_event_arch_data, cpu_id);
> +
> +	DEFINE(SBI_EXT_SSE, SBI_EXT_SSE);
> +	DEFINE(SBI_SSE_EVENT_COMPLETE, SBI_SSE_EVENT_COMPLETE);
> +	DEFINE(ASM_NR_CPUS, CONFIG_NR_CPUS);
> +#endif
>  #ifdef CONFIG_RISCV_SBI
>  	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>  	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index d799c4e56f8..0b79fa7241e 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -424,6 +424,15 @@ SYM_FUNC_END(call_on_irq_stack)
>   * arguments are passed to schedule_tail.
>   */
>  SYM_FUNC_START(__switch_to)
> +#ifdef CONFIG_RISCV_SBI_SSE
> +	/*
> +	 * Mark the interval where tp changes from prev to next. SSE entry uses
> +	 * the interrupted tp while this per-CPU pointer is NULL.
> +	 */
> +	asm_per_cpu t0, __sbi_sse_entry_task, t1
> +	REG_S zero, 0(t0)
> +#endif
> +
>  	/* Save context into prev->thread */
>  	li    a4,  TASK_THREAD_RA
>  	add   a3, a0, a4
> @@ -470,6 +479,11 @@ SYM_FUNC_START(__switch_to)
>  	REG_L s11, TASK_THREAD_S11_RA(a4)
>  	/* The offset of thread_info in task_struct is zero. */
>  	move tp, a1
> +#ifdef CONFIG_RISCV_SBI_SSE
> +	/* Publish next only after tp contains its task_struct pointer. */
> +	asm_per_cpu t0, __sbi_sse_entry_task, t1
> +	REG_S tp, 0(t0)
> +#endif
>  	/* Switch to the next shadow call stack */
>  	scs_load_current
>  	ret
> diff --git a/arch/riscv/kernel/sbi_sse.c b/arch/riscv/kernel/sbi_sse.c
> new file mode 100644
> index 00000000000..032fcc07abc
> --- /dev/null
> +++ b/arch/riscv/kernel/sbi_sse.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2025 Rivos Inc.
> + */
> +#include <linux/nmi.h>
> +#include <linux/sched.h>
> +#include <linux/scs.h>
> +#include <linux/bitfield.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/preempt.h>
> +#include <linux/string.h>
> +
> +#include <asm/asm-prototypes.h>
> +#include <asm/switch_to.h>
> +#include <asm/irq_stack.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
> +#include <asm/tlbflush.h>
> +
> +DEFINE_PER_CPU(struct task_struct *, __sbi_sse_entry_task);
> +static DEFINE_PER_CPU(struct riscv_sse_interrupted_context *,
> +			      riscv_sse_interrupted_context);
> +
> +const struct riscv_sse_interrupted_context *
> +riscv_sse_get_interrupted_context(void)
> +{
> +	return this_cpu_read(riscv_sse_interrupted_context);
> +}
> +
> +void __weak sse_handle_event(struct sse_event_arch_data *arch_evt, struct pt_regs *regs)
> +{
> +}
> +
> +void noinstr do_sse(struct sse_event_arch_data *arch_evt,
> +		    struct pt_regs *regs, unsigned long hstatus)
> +{
> +	struct riscv_sse_interrupted_context context = { regs, hstatus };
> +	struct riscv_sse_interrupted_context *previous;
> +	struct sbiret sret;
> +
> +	nmi_enter();
> +	instrumentation_begin();
> +
> +	/* Retrieve missing GPRs from SBI */
> +	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
> +			 SBI_SSE_ATTR_INTERRUPTED_A6,
> +			 (SBI_SSE_ATTR_INTERRUPTED_A7 -
> +			  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
> +			 (unsigned long)arch_evt->interrupted_phys, 0, 0);
> +	if (sret.error) {
> +		pr_warn("Failed to read interrupted registers for event %x: %ld\n",
> +			arch_evt->evt_id, sret.error);
> +		/* Let the client quiesce its source without using incomplete regs. */
> +		sse_handle_event(arch_evt, NULL);
> +		goto out;
> +	}
> +
> +	memcpy(&regs->a6, arch_evt->interrupted,
> +	       sizeof(*arch_evt->interrupted));
> +
> +	/* Make the interrupted frame visible while clients handle this event. */
> +	previous = this_cpu_read(riscv_sse_interrupted_context);
> +	this_cpu_write(riscv_sse_interrupted_context, &context);
> +	sse_handle_event(arch_evt, regs);
> +	this_cpu_write(riscv_sse_interrupted_context, previous);
> +
> +	if (memcmp(&regs->a6, arch_evt->interrupted,
> +		   sizeof(*arch_evt->interrupted))) {
> +		memcpy(arch_evt->interrupted, &regs->a6,
> +		       sizeof(*arch_evt->interrupted));
> +		sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE,
> +				 arch_evt->evt_id, SBI_SSE_ATTR_INTERRUPTED_A6,
> +				 (SBI_SSE_ATTR_INTERRUPTED_A7 -
> +				  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
> +				 (unsigned long)arch_evt->interrupted_phys, 0, 0);
> +		/*
> +		 * If writeback fails, COMPLETE resumes with firmware's original
> +		 * a6/a7 rather than treating the shared buffer as committed.
> +		 */
> +		if (sret.error)
> +			pr_warn("Failed to write interrupted registers for event %x: %ld\n",
> +				arch_evt->evt_id, sret.error);
> +	}
> +
> +out:
> +	instrumentation_end();
> +	nmi_exit();
> +}
> +
> +static void *alloc_to_stack_pointer(void *alloc)
> +{
> +	return alloc ? alloc + SSE_STACK_SIZE : NULL;
> +}
> +
> +static void *stack_pointer_to_alloc(void *stack)
> +{
> +	return stack ? stack - SSE_STACK_SIZE : NULL;
> +}
> +
> +#if defined(CONFIG_VMAP_STACK) || defined(CONFIG_SHADOW_CALL_STACK)
> +static void arch_sse_flush_tlb_range(struct sse_event_arch_data *arch_evt,
> +				     unsigned long start, unsigned long size)
> +{
> +	unsigned long end = start + size;
> +
> +	if (sse_event_is_global(arch_evt->evt_id))
> +		flush_tlb_kernel_range(start, end);
> +	else
> +		local_flush_tlb_kernel_range(start, end);
> +}
> +#endif
> +
> +static void arch_sse_shadow_stack_cpu_sync(struct sse_event_arch_data *arch_evt)
> +{
> +#ifdef CONFIG_SHADOW_CALL_STACK
> +	if (arch_evt->shadow_stack)
> +		arch_sse_flush_tlb_range(arch_evt,
> +					 (unsigned long)arch_evt->shadow_stack,
> +					 SCS_SIZE);
> +#endif
> +}
> +
> +#ifdef CONFIG_VMAP_STACK
> +static void *sse_stack_alloc(unsigned int cpu)
> +{
> +	void *stack = arch_alloc_vmap_stack(SSE_STACK_SIZE, cpu_to_node(cpu));
> +
> +	return alloc_to_stack_pointer(stack);
> +}
> +
> +static void sse_stack_free(void *stack)
> +{
> +	vfree(stack_pointer_to_alloc(stack));
> +}
> +
> +static void arch_sse_stack_cpu_sync(struct sse_event_arch_data *arch_evt)
> +{
> +	void *p_stack = arch_evt->stack;
> +	unsigned long stack = (unsigned long)stack_pointer_to_alloc(p_stack);
> +
> +	/*
> +	 * Flush the tlb to avoid taking any exception when accessing the
> +	 * vmapped stack inside the SSE handler
> +	 */
> +	arch_sse_flush_tlb_range(arch_evt, stack, SSE_STACK_SIZE);
> +
> +	arch_sse_shadow_stack_cpu_sync(arch_evt);
> +}
> +#else /* CONFIG_VMAP_STACK */
> +static void *sse_stack_alloc(unsigned int cpu)
> +{
> +	void *stack = kmalloc(SSE_STACK_SIZE, GFP_KERNEL);
> +
> +	return alloc_to_stack_pointer(stack);
> +}
> +
> +static void sse_stack_free(void *stack)
> +{
> +	kfree(stack_pointer_to_alloc(stack));
> +}
> +
> +static void arch_sse_stack_cpu_sync(struct sse_event_arch_data *arch_evt)
> +{
> +	arch_sse_shadow_stack_cpu_sync(arch_evt);
> +}
> +#endif /* CONFIG_VMAP_STACK */
> +
> +static int sse_init_scs(int cpu, struct sse_event_arch_data *arch_evt)
> +{
> +	void *stack;
> +
> +	if (!scs_is_enabled())
> +		return 0;
> +
> +	stack = scs_alloc(cpu_to_node(cpu));
> +	if (!stack)
> +		return -ENOMEM;
> +
> +	arch_evt->shadow_stack = stack;
> +
> +	return 0;
> +}
> +
> +void arch_sse_event_update_cpu(struct sse_event_arch_data *arch_evt, int cpu)
> +{
> +	arch_evt->cpu_id = cpu;
> +	arch_evt->hart_id = cpuid_to_hartid_map(cpu);
> +}
> +
> +void arch_sse_init_cpu(void)
> +{
> +	preempt_disable();
> +	this_cpu_write(__sbi_sse_entry_task, current);
> +	preempt_enable();
> +}
> +
> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt_id,
> +			int cpu)
> +{
> +	void *stack;
> +
> +	arch_evt->interrupted = kmalloc_obj(*arch_evt->interrupted, GFP_KERNEL);
> +	if (!arch_evt->interrupted)
> +		return -ENOMEM;
> +
> +	arch_evt->evt_id = evt_id;
> +	stack = sse_stack_alloc(cpu);
> +	if (!stack)
> +		goto err_free_interrupted;
> +
> +	arch_evt->stack = stack;
> +
> +	if (sse_init_scs(cpu, arch_evt)) {
> +		sse_stack_free(arch_evt->stack);
> +		goto err_free_interrupted;
> +	}
> +
> +	/* kmalloc keeps the two adjacent SBI attribute words contiguous. */
> +	arch_evt->interrupted_phys = virt_to_phys(arch_evt->interrupted);
> +
> +	arch_sse_event_update_cpu(arch_evt, cpu);
> +
> +	return 0;
> +
> +err_free_interrupted:
> +	kfree(arch_evt->interrupted);
> +	arch_evt->interrupted = NULL;
> +	return -ENOMEM;
> +}
> +
> +void arch_sse_free_event(struct sse_event_arch_data *arch_evt)
> +{
> +	scs_free(arch_evt->shadow_stack);
> +	sse_stack_free(arch_evt->stack);
> +	kfree(arch_evt->interrupted);
> +}
> +
> +int arch_sse_register_event(struct sse_event_arch_data *arch_evt)
> +{
> +	struct sbiret sret;
> +
> +	arch_sse_stack_cpu_sync(arch_evt);
> +
> +	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_REGISTER, arch_evt->evt_id,
> +			 (unsigned long)handle_sse, (unsigned long)arch_evt, 0,
> +			 0, 0);
> +	if (sret.error == SBI_ERR_NOT_SUPPORTED)
> +		return -EOPNOTSUPP;
> +
> +	return sbi_err_map_linux_errno(sret.error);
> +}
> diff --git a/arch/riscv/kernel/sbi_sse_entry.S b/arch/riscv/kernel/sbi_sse_entry.S
> new file mode 100644
> index 00000000000..1e38fbb1c2a
> --- /dev/null
> +++ b/arch/riscv/kernel/sbi_sse_entry.S
> @@ -0,0 +1,237 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2025 Rivos Inc.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/linkage.h>
> +
> +#include <asm/alternative-macros.h>
> +#include <asm/asm.h>
> +#include <asm/csr.h>
> +#include <asm/hwcap.h>
> +#include <asm/scs.h>
> +
> +/* When entering handle_sse, the following registers are set:
> + * a6: contains the hartid
> + * a7: contains a sse_event_arch_data struct pointer
> + */
> +SYM_CODE_START(handle_sse)
> +	/* Save stack temporarily */
> +	REG_S sp, SSE_REG_EVT_TMP(a7)
> +	/* Set entry stack */
> +	REG_L sp, SSE_REG_EVT_STACK(a7)
> +
> +	addi sp, sp, -(PT_SIZE_ON_STACK)
> +	REG_S ra, PT_RA(sp)
> +	REG_S s0, PT_S0(sp)
> +	REG_S s1, PT_S1(sp)
> +	REG_S s2, PT_S2(sp)
> +	REG_S s3, PT_S3(sp)
> +	REG_S s4, PT_S4(sp)
> +	REG_S s5, PT_S5(sp)
> +	REG_S s6, PT_S6(sp)
> +	REG_S s7, PT_S7(sp)
> +	REG_S s8, PT_S8(sp)
> +	REG_S s9, PT_S9(sp)
> +	REG_S s10, PT_S10(sp)
> +	REG_S s11, PT_S11(sp)
> +	REG_S tp, PT_TP(sp)
> +	REG_S t0, PT_T0(sp)
> +	REG_S t1, PT_T1(sp)
> +	REG_S t2, PT_T2(sp)
> +	REG_S t3, PT_T3(sp)
> +	REG_S t4, PT_T4(sp)
> +	REG_S t5, PT_T5(sp)
> +	REG_S t6, PT_T6(sp)
> +	REG_S gp, PT_GP(sp)
> +	REG_S a0, PT_A0(sp)
> +	REG_S a1, PT_A1(sp)
> +	REG_S a2, PT_A2(sp)
> +	REG_S a3, PT_A3(sp)
> +	REG_S a4, PT_A4(sp)
> +	REG_S a5, PT_A5(sp)
> +
> +	/* Retrieve entry sp */
> +	REG_L a4, SSE_REG_EVT_TMP(a7)
> +	/* Save CSRs */
> +	csrr a0, CSR_EPC
> +	csrr a1, CSR_SSTATUS
> +	csrr a2, CSR_STVAL
> +	csrr a3, CSR_SCAUSE
> +
> +	REG_S a0, PT_EPC(sp)
> +	REG_S a1, PT_STATUS(sp)
> +	REG_S a2, PT_BADADDR(sp)
> +	REG_S a3, PT_CAUSE(sp)
> +	REG_S a4, PT_SP(sp)
> +
> +	/* Disable user memory access and floating/vector computing */
> +	li t0, SR_SUM | SR_FS_VS
> +	csrc CSR_STATUS, t0
> +
> +	load_global_pointer
> +	scs_load_sse_stack a7
> +
> +#ifdef CONFIG_SMP
> +	REG_L t4, SSE_REG_HART_ID(a7)
> +	lw t3, SSE_REG_CPU_ID(a7)
> +
> +	bne t4, a6, .Lfind_hart_id_slowpath
> +
> +.Lcpu_id_found:
> +#else
> +	mv t3, zero
> +#endif
> +
> +	asm_per_cpu_with_cpu t2 __sbi_sse_entry_task t1 t3
> +	REG_L tp, 0(t2)
> +	bnez tp, .Lcurrent_task_found
> +
> +	/* __switch_to() marks its transition window with a NULL entry task. */
> +	REG_L tp, PT_TP(sp)
> +
> +.Lcurrent_task_found:
> +	/* Nested exceptions temporarily replace these with the SSE stack. */
> +	REG_L s6, TASK_TI_KERNEL_SP(tp)
> +	REG_L s7, TASK_TI_USER_SP(tp)
> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
> +	/* A nested fault must not overwrite an interrupted trap's scratch slots. */
> +	REG_L s8, TASK_TI_A0(tp)
> +	REG_L s9, TASK_TI_A1(tp)
> +	REG_L s10, TASK_TI_A2(tp)
> +#endif
> +
> +	mv a1, sp /* pt_regs on stack */
> +
> +	/*
> +	 * Run the SSE handler with the normal exception vector, but restore the
> +	 * interrupted stvec before completing the event. SSE can arrive while
> +	 * the kernel is using a temporary trap vector in a sensitive entry path.
> +	 */
> +	csrr s3, CSR_STVEC
> +	la t0, handle_exception
> +	csrw CSR_STVEC, t0
> +
> +	/*
> +	 * Preserve the full HS-mode virtualization state across the handler.
> +	 * hstatus is live supervisor state rather than an SSE interrupted
> +	 * attribute, and OpenSBI consumes hstatus.SPV during event completion.
> +	 * Saving the whole CSR keeps the handler episode transparent to KVM and
> +	 * avoids having to infer which hstatus bits may matter to a guest resume.
> +	 */
> +	li s5, 0
> +	ALTERNATIVE("nop", "csrr s5, hstatus", 0, RISCV_ISA_EXT_H, 1)
> +
> +	/*
> +	 * Save sscratch for restoration since we might have interrupted the
> +	 * kernel in early exception path and thus, we don't know the content of
> +	 * sscratch.
> +	 */
> +	csrrw s4, CSR_SSCRATCH, x0
> +
> +	mv a0, a7
> +	mv a2, s5
> +
> +	call do_sse
> +
> +	/* Leave no reference to the event stack in the interrupted task. */
> +	REG_S s7, TASK_TI_USER_SP(tp)
> +	REG_S s6, TASK_TI_KERNEL_SP(tp)
> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
> +	REG_S s8, TASK_TI_A0(tp)
> +	REG_S s9, TASK_TI_A1(tp)
> +	REG_S s10, TASK_TI_A2(tp)
> +#endif
> +
> +	csrw CSR_SSCRATCH, s4
> +	ALTERNATIVE("nop", "csrw hstatus, s5", 0, RISCV_ISA_EXT_H, 1)
> +	csrw CSR_STVEC, s3
> +
> +	REG_L a0, PT_STATUS(sp)
> +	REG_L a1, PT_EPC(sp)
> +	REG_L a2, PT_BADADDR(sp)
> +	REG_L a3, PT_CAUSE(sp)
> +	csrw CSR_SSTATUS, a0
> +	csrw CSR_EPC, a1
> +	csrw CSR_STVAL, a2
> +	csrw CSR_SCAUSE, a3
> +
> +	REG_L ra, PT_RA(sp)
> +	REG_L s0, PT_S0(sp)
> +	REG_L s1, PT_S1(sp)
> +	REG_L s2, PT_S2(sp)
> +	REG_L s3, PT_S3(sp)
> +	REG_L s4, PT_S4(sp)
> +	REG_L s5, PT_S5(sp)
> +	REG_L s6, PT_S6(sp)
> +	REG_L s7, PT_S7(sp)
> +	REG_L s8, PT_S8(sp)
> +	REG_L s9, PT_S9(sp)
> +	REG_L s10, PT_S10(sp)
> +	REG_L s11, PT_S11(sp)
> +	REG_L tp, PT_TP(sp)
> +	REG_L t0, PT_T0(sp)
> +	REG_L t1, PT_T1(sp)
> +	REG_L t2, PT_T2(sp)
> +	REG_L t3, PT_T3(sp)
> +	REG_L t4, PT_T4(sp)
> +	REG_L t5, PT_T5(sp)
> +	REG_L t6, PT_T6(sp)
> +	REG_L gp, PT_GP(sp)
> +	REG_L a0, PT_A0(sp)
> +	REG_L a1, PT_A1(sp)
> +	REG_L a2, PT_A2(sp)
> +	REG_L a3, PT_A3(sp)
> +	REG_L a4, PT_A4(sp)
> +	REG_L a5, PT_A5(sp)
> +
> +	REG_L sp, PT_SP(sp)
> +
> +	li a7, SBI_EXT_SSE
> +	li a6, SBI_SSE_EVENT_COMPLETE
> +	ecall
> +
> +	/*
> +	 * COMPLETE must resume the interrupted context and never return. Trap
> +	 * through the normal vector instead of falling into adjacent assembly.
> +	 */
> +	la t0, handle_exception
> +	csrw CSR_STVEC, t0
> +	ebreak
> +	/* The fatal trap must not return; execution should never reach here. */
> +
> +#ifdef CONFIG_SMP
> +.Lfind_hart_id_slowpath:
> +
> +	/* Restore current task struct from __sbi_sse_entry_task */
> +	li t1, ASM_NR_CPUS
> +	/* Slowpath to find the CPU id associated to the hart id */
> +	la t0, __cpuid_to_hartid_map
> +	li t3, 0
> +
> +.Lhart_id_loop:
> +	REG_L t2, 0(t0)
> +	beq t2, a6, .Lcpu_id_found
> +
> +	/* Increment pointer and CPU number */
> +	addi t3, t3, 1
> +	addi t0, t0, RISCV_SZPTR
> +	bltu t3, t1, .Lhart_id_loop
> +
> +	/*
> +	 * This should never happen since we expect the hart_id to match one
> +	 * of our CPU, but better be safe than sorry
> +	 */
> +	la tp, init_task
> +	la a0, sse_hart_id_panic_string
> +	la t0, panic
> +	jalr t0
> +#endif
> +
> +SYM_CODE_END(handle_sse)
> +ASM_NOKPROBE(handle_sse)
> +
> +SYM_DATA_START_LOCAL(sse_hart_id_panic_string)
> +    .ascii "Unable to match hart_id with cpu\0"
> +SYM_DATA_END(sse_hart_id_panic_string)
> -- 
> 2.50.1 (Apple Git-155)
> 

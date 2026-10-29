Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257771;
	b=niUnYmkRmc7XsjpM0OCSGJK4i+jk23QRM9bLohe8aQUYJJ8rnKLmdS+PVhu23ejSZhiA
	 KAAZ0BN0evejht9FCFstLTGDrKmv32vOA6hrECOBG51kodE+EUOUFqG7JkGVsZbpZ4/Wx
	 mNyBHqIRrZbHO1F5eyDeSZJEgzN7EZIlvzPgrPEOde8O8Gp/NpWSBHWqa6KVJkDtvyGfz
	 Sxg99YGhA5rk6isC+efQqD+wy8fgyfWtFj1H23ET+KgBHOg6Dj5Zw5qVv4Iss4xYmCV0N
	 xu69TZwwWr2tLA84FTDCqYJyTAay+bDtnDy0TzXTMP4/DtlcduJ2PbE9QXiyrLEZGUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
	b=xNKPzOXc5ZerkaY11nqsprGznKMJcTLyOpltlJw9SsbNhkoaDkg5BvmVkZf+Vf80pPpw
	 yGAVmDoDiApJ9NsIEgPVN8di4Mv974JZ5Rbi9cb7KNYZlBKhDUEANgZYG8q81V3C8W6ck
	 HeuAhk8JWK5PFj6qtXCqjW/HsVaCln1PfSDseKo95uUetx8Jvrq60NYoHiB/53ZEHij2+
	 WeBNHt9zspoh+V9Mtb/w/viHCo+6//13/eParGKRlC+wVyLWbqRThBusB2BcQC4tLdafH
	 yvCtrhFqTTprRTbAeLIqF7Ibi/4ahLZ6CqXocBZWfbG72bFdQb5w/7cq4S/X0Ig39lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WWNiY/VA";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmGiNTg4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA65606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 07:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWNiY/VA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmGiNTg4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HI7W3889832
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 07:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=; b=WWNiY/VATgyYMqMt
	kWCFCPZNmeAuzOciF9qUfhoFxfGyr4tnHwXRaiqfTMEuEnbH9eqP+T6hQRblF+T1
	erZfkl44iSRBXVfyF5ZdHmp+V84AO2tlhjCF2PrBjIvJhxoUvFb4F5LmYyscYYz+
	PbdGAr+J4FqOnIpq83+VwbKA933OGl7DZLV9WrX5SX5U56XPy7JA4HAM6TXHLxe5
	sxW0GauZtTQA1mizjVmlGw0QhlAWChW5IMVGTsx4uHOHfK+uB7dfSoNPHVmaktQ2
	TEbS5NZTFeh46Bcd4auuuu5kOcCWvyLlHXTld4rfSz1CyCO6wQDwEsEPTGhj2AwB
	JKULKw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2awt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 07:09:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso814083eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793257769; x=1793862569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
        b=AmGiNTg4giKJshMAtf6PaJVe0x74bg1wmRbssHcp7tI/v3m28U9KonmV7heEcNJ9DU
         Yvw2uIFnScfqAGJMFn8EVXg1gsTbycM200i4g+spS2C9oO3H7JwmwBnaRWekFJ4C5fJS
         1Srk5KgFVUmLGOkuEZnKoWEARy/a5wy3+7M2n+EeJ1ikIzNlfyS61NyebeXpw29DV8ni
         r3B7fGOYHO6Ua75BBZ3u1Bpb/B0q4fUxVSj+ax68ty0ueLPsUQzhomjBbk7mgPEWvMtP
         h6wVJ8nbGmsgo9HmD2u7hSYnB/TjiudsidkZgdFiVfozRekrr6symlvYh80ALqAZn5Pr
         oJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257769; x=1793862569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v33azddHtAnqfbOpoBcm9w2YymvAzUMFZ2ge/uZDhi8=;
        b=gyat37+wL6EiP62vPRCP2TH2fwksMavM1mZNu7E3ajqDceb3RiowEIXVzL7yrpIe1E
         iaKm6QN9WCWZa3rawubVqNSU5Y+vC0+rBNAcHbk8ELVJ71+7RTyNOHaU2UApflbyii6o
         ozsX2PEk+T3ACshg38ZjIZ3Nx2emnW8Zs92f1CMYx+0KVMcYDnMuTDCLllhBFaZrqTrp
         eh7Xj7PORRNuEAIy7QLfdmWvWjkFVdKwh+xZ7SmOlb6UTmHzmmTkT4Cls29MZZZZX77i
         sHB4fjKVay96KvL1rF/94It5lsYMh/pVofRopGiOR1Pt1uZMNrsFB/UOvGb7C9irrpYK
         W10w==
X-Forwarded-Encrypted: i=1; AKwUvBxOk46ZcL6E/YQcXw07OLRjjHYrnC/qU+xvFz0Zkbkux2Fj3E4BNNqrDwLZu9hz6D/jRCqvwjaQ0JYZ0K2algQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3XvdmwvIiql8toOZTd5vYQdTel1IT3fCu2rZDK77mVfSoilz8
	Rdpg1mfiMKIytI3acay7Sbj6nbmt+lBqmoo91OCfCYygVTpBPm9b+3tVmzi7q52rzjOMemKRYFK
	JSqc6oNaF1vowBCHNDg3sRMAWebaDEI++0Pw80fjsNqg7VUgkljdFUBeQeYsb2qYJwBtopuk=
X-Gm-Gg: AYBFou1wR2KgwoN3dvAAlbSZQh1Va20JKGpzPrnzreBHAYYd3mFInDT4uIL6LPsrEd3
	NbH7nz8LluYXH9QFYrcBr10OsMs6pWtW2gBCu+m4hbgeD5DR6Ftsh9W3ATEnM4p2bZ/PcK4w1XJ
	L5U2fbGNzoiDUTXylZZDMIVSUSJp/Z2ZvsIv1zTsT4XsOIec55YLkt18ZqdyZzbiN2yP2ul87Tp
	p0vEZe2l9kK8dNEq6wNF3/NuwfuElIwXXxz+HfuIpXZeh+vcLbPrF7Ee3+ToXxdbJNSaVk4JoeY
	O3vnMNRE5JLJ0im8bj0OgTNdR8c3cE4hmSdS/NHxuSyFK50JsENa4Uj+n+vDEzwyYjjTuHJQIvw
	qL48y/OL6rVLpGzp/zH0EeVI3ll7CxMlp3Aig77pS3xnej2cwcBgnsMGZJb76qU4xhC2q2MiOWX
	dGAK6cVDFtw+z5vJfMAawp7cftFDen9h+HVE+CtHFTkZFEgSrS+45qcqLBNG9sIDElKAMgekuTY
	A==
X-Received: by 2002:a05:7022:fa7:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1a944924513mr3514455c88.15.1793257768814;
        Thu, 29 Oct 2026 00:09:28 -0700 (PDT)
X-Received: by 2002:a05:7022:fa7:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1a944924513mr3514415c88.15.1793257768069;
        Thu, 29 Oct 2026 00:09:28 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a760569d53sm12372655c88.23.2026.10.29.00.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:09:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:39:16 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>
Cc: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        Paul Walmsley <pjw@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Alexandre Ghiti <alex@ghiti.fr>, Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
Message-ID: <auLxHK4g-_MvFyrp@hu-himchau-blr.qualcomm.com>
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
 <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
 <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2f129 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=968KyxNXAAAA:8 a=lYWFnMbivg8TxhJFMxEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: wHD2CXIzcQXDExpGOBj0MswuPxRcrVcF
X-Proofpoint-ORIG-GUID: wHD2CXIzcQXDExpGOBj0MswuPxRcrVcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfX/ZEGsW9wZXFW
 HCfsks4LpT5vJDdKrCTMY6U1g9A/uODSfTeBtxtCrVgGTfE93hysesHi2+KwFc7HQuEF7jodNwy
 BxSzRVJyDh5TTCFRmfSRS4hjNJv4xoCw/r990WLtUF8pC5E5D6/odFDyftfBdVJ4jAJzkDTvuyB
 gJz/OfGToieMinqW6P4a5vq+3Xx0JQIpEOuzJLg3+ifwqXI1P0s0GTEJxdxwarvhKv0z8NQY8bx
 eSTa8llQ+EoV0tGStWhzXampgUlTY2Eb8eix+a3cnzopdwm84Wxsihm+sYlb9yVfqQisrfNnepJ
 DEpNsKR3N6aIK6rxdCm8aXvqZsyJleeSsqaFJXhk5Yevp8WUrFi/Zq1bWK6h1A3KESDZwMBurFJ
 +9SeEcv06SAIhQCLbGedGGy+Dj0mrceTPlMS6IfxBfC1FtviKw9BxYW1wUE/w6j2nFSHx5Z2YJB
 FJ7ILzgPHNB2sUtxE6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyNyBTYWx0ZWRfX/DajFtJPdnC/
 f8D0BNFOaFDUEkP/T/97u3yx14qZOUePgmgl/cehnH17WiiI7bnAsMpFw7vDmsVg5TAfv9ql4iC
 v0GMM24YoLHO+hYE8gzi3lrJS7SCMdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290027

On Thu, Oct 29, 2026 at 11:32:36AM +0530, Anup Patel wrote:
> On Thu, Oct 29, 2026 at 9:10 AM Zhanpeng Zhang
> <zhangzhanpeng.jasper@bytedance.com> wrote:
> >
> > Hi all,
> >
> > On 10/29/26 11:17 AM, Anup Patel wrote:
> > > On Thu, Oct 29, 2026 at 8:36 AM Zhanpeng Zhang
> > > <zhangzhanpeng.jasper@bytedance.com> wrote:
> > >>
> > >> Hi Anup, Paul, Himanshu,
> > >>
> > >> On 10/29/26 12:55 AM, Anup Patel wrote:
> > >>
> > >>> [...]
> > >>>
> > >>> Changes in v11
> > >>> ==============
> > >>>
> > >>> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf65cee).
> > >>> Also, tested PMU driver with both PMU irqs and PMU SSE events.
> > >>>
> > >>
> > >> Thanks for rebasing and testing the series. I was a little surprised
> > >> to see v11 posted, as I am still working through Himanshu's v10 review
> > >> and validating the fixes on hardware. It would have been helpful to
> > >> coordinate before reposting so that those changes could be included.
> > >>
> > >> I guess this follows Paul's request to rebase onto riscv/for-next.
> > >> However, there is one change beyond the rebase that I would like to
> > >> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> > >> from the CPU hotplug paths? These were present in v10 RESEND, and
> > >> the local helpers still retain their preemption-disabled assertions.
> > >> Is there a reason this protection is no longer needed?
> > >
> > > Yes, this is based on discussion with Paul yesterday.
> > >
> > > This series is blocking the whole RAS ACPI support.
> > >
> > >>
> > >> The changes discussed on the v10 threads are still outstanding in
> > >> this posting:
> > >>
> > >> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> > >> - Replace the temporary GUP-based perf user-stack copy with nofault
> > >>     uaccess, following the x86 approach.
> > >> - Address the per-CPU initialization/preemption concern.
> > >> - Split the MAINTAINERS updates into a separate patch.
> > >
> > > There is always going to be new updates since it will take
> > > time to harden the SSE implementation. All these changes
> > > can be done as separate follow-on patches.
> > >
> > >>
> > >> Additional fixes from Sashiko review, the kernel test robot report,
> > >> and our follow-up debugging are also being consolidated:
> > >>
> > >> - NMI-safe entry and lockdep irqflags tracking.
> > >> - The unused-function warning reported by the kernel test robot.
> > >> - RV32 vmalloc synchronization before nofault fixup.
> > >> - Faulting-PC validation in the kprobe single-step fault path.
> > >> - Per-counter STOP handling in SSE error paths.
> > >> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.
> > >
> > > Same comment as above, please do this as separate series.
> > > No point in holding all other dependent work endlessly.
> > >
> >
> > I agree that we should unblock the dependent work. However, I would
> > not characterize addressing a known, reproduced issue as holding things
> > up endlessly.
> >
> > >>
> > >> In particular, Himanshu identified the missing preservation of
> > >> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> > >> I validated the fix with hardware A/B testing: removing it reproduced
> > >> corruption, while the fixed kernel completed the same test sequence.
> > >> This also gives us a solid basis for replacing the temporary GUP
> > >> workaround with nofault uaccess.
> > >>
> > >> Paul, please hold off on taking this version into for-next until
> > >> these fixes are included. The rebase and PMU testing are useful, but
> > >> there are still outstanding correctness issues.
> > >>
> > >> I will consolidate the changes and post v12 against riscv/for-next,
> > >> with an updated changelog and validation results. Let's coordinate
> > >> the next posting to keep everything together.
> > >>
> > >> Thanks,
> > >> Zhanpeng
> > >>
> > >> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
> > >
> > > Regards,
> > > Anup
> >
> > I'll post a focused v12 before this weekend with the immediate
> > correctness fixes. Further improvements can follow separately.
> 
> Linux-7.4 merge window closes end-of this week so your v12
> will be too late for it hence I suggest sending incremental fixes
> separately.
>

Hi Zhanpeng,

I agree with Anup. IMO, SSE as a feature is ready. It will be easier
for you and for me if the patches are merged. It has become a pain to
send revised RAS patches because of the dependency.The issue that I
identified can be sent incrementally in coming weeks.

I would request Paul to pick up the SSE patches now.

Regards
Himanshu

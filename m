Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019175;
	b=Vj/iAuZhfw/FnIoV5te9zCiRnQ6msLKrt4femhPFP1UWjfHW4/SJvnuSwdZR8VBB6YGJ
	 PP6E5OuRekB4oC4y4CaB9wUvk/hPNmu647BtWWeOs7JDmhmVwWJkDQe8Z9HxhohVS8HSc
	 LjytFIm1PPwvr7HZp3Q7lpAsXMamwkw/O1BzHTFjH54Oi6yU7J+R/HxWUUuY6qdspjveR
	 bFa4DXRYmNDBaOC3lpaCeakFo/Tu1mSZiZOQq7ejUiCIDpMhHRQyrJ7Adw4QaZE0f3qLO
	 Me5CAo/NMnsVmtAvB1bzZGxjY/5BOSmK7jGzeqyBm+sO/Dx0p6h0z7bwvYtJ9YhoL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yPqS9+jjib1sxM+lashj/lPQvrYKSiMhFD5RdhnO7D0=;
	b=if7nPV/LdaRoRxwvaAT0ltmlgojshuGRweWsS5TPO7qTQbrxVRDC4CIfBkl2LIZ10DtA
	 gIv8j/5ZAnMN68w8ZO0fdvBHDzs9pUqiPEJ7bLY+xB0jT3aubcdxulOC6K1jCPqAshiUb
	 Vg44tJVrdaoDkYrrd96kM9WbfgZ82cze/O6y/iiYYEP+DaGrM21lSPKYsMxT8/bjuVwRu
	 wr02MxnSv5Y5l/hnWjGVl6HjGsRpTfZVC7XuiFA6WuX+Epox589aCVQtmSEG1muD/aMKz
	 kpxzyoNqPYEpykt+mjbzHguklNV396I1Jl7hnWiVzI7UblygHp6rjkgVgCuXfJmW55Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="prQuEx/r";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brSFHu5I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE86606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE86606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=prQuEx/r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brSFHu5I
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72ArlO436636
	for <linux-kselftest@vger.kernel.org>; Sat, 7 Nov 2026 02:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yPqS9+jjib1sxM+lashj/lPQvrYKSiMhFD5
	RdhnO7D0=; b=prQuEx/rq64IvGjKtB6ZhmV3sHxdSim4xZlwhchPEwZk9dCeAhW
	6wq4vss9cQEzzvbBiUFcavNg/55mtjMFdkL7yTnfk7DdRQU8ib40vIgMvtRSKel1
	du8vGjdJXtkdGXU3VLV8eJdvRU9c0mWi3bGd1xfAFhwnqAoW05/n+jIQcUWQwI59
	AP+oJfOH5JT5l2ag+lVDGj6FnaLUR0HQfX/DQ5Gc3cOkgQsegAcMsR98NR1KqcZL
	5qlz0xq31NJrMmWl9yXnpxGS/dBwApzyjkikODk4y0oHfnd+AfNSVQjDgjUFV2aS
	BgSMpAZj+6OTfvE/SIUj4h4NwH1P2HKsH5g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmeb1amw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 02:39:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso348977eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019173; x=1794623973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPqS9+jjib1sxM+lashj/lPQvrYKSiMhFD5RdhnO7D0=;
        b=brSFHu5I+SddIrjnIWHVH++A87daU6Zoa/V/zezWCf6wnYGZ26VuwR3EFwuRzGE5lJ
         7AblpjCC56ECRLidIROi2yNmqYN8m3nb2JhTHQT16cXIXeoyIWWBcrIqDWhE9ctw64Jj
         0ES/IQnQg+hNooRMZvkhUAno/LdOoygCBRliFuve4/KzdLqqhpv8b1MeiU9hQufGSGFB
         I1gjrgezmzpy9CrNIUZ537Rje+ooaxavAAQpdIkJD9IrBVYhMAIYB4pZdqyRF7lCuqbf
         d0Q90MfCXeUonHEYQ6RmTe//my6ntxiDTntLW5Sskmlr6gMzGBXCXdj71OU5GF376gG0
         BjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019173; x=1794623973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPqS9+jjib1sxM+lashj/lPQvrYKSiMhFD5RdhnO7D0=;
        b=wT2CzeII7zdZ28FNAg+yvNwMuK+MmSoF+vKoRnyKJpFi7DErs7VI7ld1I4iwDEfP+N
         UwRkEJadEc9djQzOnFa+HAg0Gc0RZ4m94ddVNnW1kFrYGJ0ceFznd1yKJmQgUlL82fTa
         FfcaiSFOC0jBNLNlRbpBSIxwsmHH4r7/w84pg83yMpsL/JwEVeq8FY704xpX8ZBeF0UL
         xsTJlKdC9saAQz9MRnMdzzml4oEKDfGTFGY6VFddWc0zyd7sEzw1JSM1CaXQFFS3W1cT
         kCcJXqnnOq9AbgZY+kcrsKXFUS+WJ37YsPVM/5Qez1+bYnKPJqWdMpGFrvqQoYKG/8lP
         wpTg==
X-Forwarded-Encrypted: i=1; AL+hErGzFl0L9SCTrf7ilImm8U0s3+scivV6Sm7LGbRgks3UKvGhAoS97p1zeeGuFfzl7yEHT09eYBEqUPl4Pz97NCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PEu33pybULby7GB2Mu5XN1ZzXhunnrNiYkMP6y03f4qpKsKAA
	b5dB0PnXapXCZy/ftiSw5aIEj1JfZXCI9Pb8KDvB6XSONOr0nvDRERx57M8UOlK5+s7aECzLkZT
	iyfSUJLU0ZnPv7Il+orUZvghXvLg5TqZmxkYAavS2CmR2c7T3j0thKtGKh3pSVAYaV1X4UQo=
X-Gm-Gg: AYBFou2/ydFno+6tBUlZ7givyTOql9W5yXE1gAYHdf5IaP957DPw7FnE25GLbyKNBxk
	49Rzhg4pSYg0Me+J1P37UjxQqL8HGd/PT5nwQsff9P0C0rjxVDrKYeOH1PiHcr2AR8QLvYsYXdF
	cLPKTt8wIVKbyBxiDjP8vFuZL0vSYyEPbWpKjqgyiv946ejkXrJqTs+BXFhNGeS17X/Ka3ullbQ
	VOYtrGNToFgb73Nq1imEv3apIv3GFsYf8aYFCsCU66c4SYSkxGBeMOw+ZKFuWHfO5UDQRj1brhf
	e1uWFYP+nkiRs1Wldy99+X8olxRhqplDUWdIpz6yPoxhOAGri5HclI2g4s/UN6enK1iJ8O/SpoN
	2fOKLRKUl8gOz/IpGXVumxCNd0qxAfovrsyTbFGy18AjPcuh1SdRuUGyHG5Wf8v+Aw+nNm0PE5T
	yaZzkPFFspfLr4NJM386u84FDU0HiAQ5YX7eYrtSLjQxSHhs/pElewg/XsC/qqD2kt71g3ac76u
	Q==
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr1169917eec.14.1794019172285;
        Fri, 06 Nov 2026 18:39:32 -0800 (PST)
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr1169834eec.14.1794019171274;
        Fri, 06 Nov 2026 18:39:31 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:39:30 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 0/8] riscv: Introduce support for hardware break/watchpoints
Date: Sat,  7 Nov 2026 08:09:09 +0530
Message-ID: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bxz7e4vSI9u3pH3cq3K5Zyz3Vzf1Z5zb
X-Authority-Analysis: v=2.4 cv=DOAacCNb c=1 sm=1 tr=0 ts=6aee8f65 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=HwFc7jivAAAA:8 a=_NFv3PjsgsRmLWfyS6wA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfXwXnJxciAXbmj
 pMK8jhexUfwOxnDyNTRROAkF7QufzLthBweSz2xAtSEBUlKuX8bwo4O1SkrZ/JH7WoZenysMbfu
 qzx0Y3+OVNuz0ten7fYzUoj4qr8gdt8=
X-Proofpoint-ORIG-GUID: bxz7e4vSI9u3pH3cq3K5Zyz3Vzf1Z5zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfXy7hCPVwqk2nF
 qNOuVrNzDoeI8u6A0A0BTYfm6pVRd60k3t5QiZiJ1MDIuoCTVxm1L3hQ72xRZlVaWY+XefmkvC2
 ZFUafCwUl+5NRX/yoNxwU4rGUMhH4xQrAdT59M0MilqeEQEmUA/ubj2X7LoU5SNotA1U+tCbvfR
 KvbiiENqaOox9mUqPvRgEmzrIFWkAWN7P192o5TMsAgdLBKSNQScHl1VjKUaw2hXjVvwwWkHtNm
 h3H5J4mthj84OO9Bx1FZ1ulsXq3rkrKdWaQaawl1ItzuxdbBYyXXRL9r9oPPKCLgrktghOZSJEH
 2OA/Ipfo9PkJJCmFrPsSq2TCXOtOhi1STcRap9ym1EvvP+IrLT5WhfSwaVMgT8Oj32qDmZcw/yt
 g2DiIZb1IHzi/4hhNWbiftP2wkBFv5qIfrrfVArCpzwh+lH4+UtJRIMlv8ufCquOb/9Vzv7vNDD
 OVSkqL0ugeCr2j9wiFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070010

This patchset adds support for hardware breakpoints and watchpoints in the
RISC-V architecture. The framework is built on top of the perf/ptrace subsystem
and the SBI debug trigger extension (Sdtrig).

Single stepping uses icount when it is available. The software stepping path is
kept as a fallback for systems where icount is not available.

The icount path depends on a QEMU fix so that, when an icount trigger fires,
the exception PC follows the Sdtrig action rule: "xepc must contain the virtual
address of the next instruction that must be executed to preserve the program
flow." For QEMU testing, please use:
  https://github.com/hschauhan/qemu/tree/hschauhan/sdtrig-icount-fix

Virtualization of debug triggers is pending. The patch set is ready but needs
testing.

Changes from v7:
  - Rebased to v7.4-rc1 and folded maintainer entries into the patches that
    add the maintained files.
  - Reworked the patch structure:
    - one patch for the direct single-slot ptrace requests
    - one patch for the register set interface
    - debug trigger encoding details kept internal from the introductory patch
  - Tightened breakpoint and watchpoint handling:
    - trigger setup, update, uninstall, cleanup, and error paths
    - debug trap races with trigger programming
    - hit state cleanup so stale hardware state is not reused
    - cleanup across program replacement and fork
    - bounds, overflow, and wider-access watchpoint matching
  - Improved ptrace support:
    - both ptrace interfaces now share the same breakpoint/watchpoint storage
    - 32-bit traced tasks are supported on 64-bit kernels
    - partial writes and bad indexes are rejected more carefully
  - Improved single stepping:
    - icount is used when available, so the hardware reports the next PC and
      the kernel does not have to decode the stepped instruction
    - software stepping remains as the fallback and now handles indirect
      branches, kernel-address instruction fetches, and mode-specific temporary
      triggers more carefully
    - unsafe software-step cases are rejected instead of looping on the same
      address, and the original breakpoint is restored if stepping lands
      somewhere unexpected
    - CPU-wide software stepping is rejected when icount is unavailable; there
      is no task to follow, and the fallback needs per-task state
    - unused saved trigger state was removed, and the QEMU icount fix needed for
      testing is documented
  - Improved selftests:
    - icount stepping over a taken branch
    - cleanup of failed child processes
    - failure propagation to the process exit status
    - bounded waits for expected signals
    - breakpoint/watchpoint readback validation
    - native riscv64 build handling and RISC-V-only test flags
  - Built and tested QEMU, OpenSBI, Linux, the breakpoint selftest, perf tests,
    RV32 compat ptrace tests, icount stepping, and software-step fallback

Changes from v6:
  - Rebased to v7.3-rc5
  - Added HIT0/1 bit check/clear in breakpoint handler with EPC/Bp address check
  - Removed dbtr_shmem null check as pointed by Qinfang Deng
  - Fixed MEM_HI/MEM_LO macros to work both on rv64/32
  - Changed unsigned long to __u64 from hwdebug state struct and dropped packing
  - Gated HAVE_MIXED_BREAKPOINT_REGS with PERF_EVENTS
  - Software base single stepping with mcontrol6 trigger type.
  - icount is still under development.
  - Moved and and reworked instruction decoding code to a common file.
  - perf test suite now supported.
	- Breakpoint overflow signal handler
	- Breakpoint overflow sampling
	- Breakpoint accounting (needs sudo)
	- Watchpoint
	  - Read Only Watchpoint
	  - Write Only Watchpoint
	  - Read / Write Watchpoint
	  - Modify Watchpoint
  - __test_function in "Breakpoint overflow signal handler" is name noinline
  - Fixed warnings from checkpatch.pl --strict

Changes from v5:
  - Rebased to v7.2-rc6
  - Simplified Macros in hw_breakpoint.h
  - Took care of the review comments
  - Added ptrace support for hardware break/watchpoints (new patch)
    - PTRACE_GETREGSET/SETREGSET via NT_RISCV_HW_BREAK / NT_RISCV_HW_WATCH
    - PTRACE_GETHBPREGS / SETHBPREGS for direct single-trigger access
    - HAVE_MIXED_BREAKPOINTS_REGS selected (break/watch share trigger pool)
    - flush_ptrace_hw_breakpoint / ptrace_hw_copy_thread wired up
  - Extended selftest to cover ptrace-based hw break/watchpoint paths (new patch)

Changes from v4:
  - Rebased to v7.2-rc4
  - Fixed rv32 build error
  - Added pr_fmt to print KBUILD_MODNAME
  - Changed type of shmem_pa to phys_addr_t
  - Use per_cpu_ptr_to_phys instead of __pa for per-cpu allocated memory
  - Print successful registration/unregistration message when no error
  - Added RISC-V DEBUGGING section in MAINTAINERS and added myself as maintainer
  - Fixed warnings from checkpatch.pl --strict run

Changes from v3:
  - Rebased to v7.1-rc3
  - For watchpoints, check tdata1.hit via SBI_EXT_DBTR_TRIG_READ and keep
    STVAL-based matching as fallback
  - Improved watchpoint matching when STVAL reports the lowest accessed address
    for wider memory accesses
  - Program execute breakpoints with SIZE=0 (match any size) to avoid misses
    with 16-bit/compressed instruction addresses
  - Updated selftest to avoid deadlock by replacing unbounded sem_wait() with
    sem_timedwait() timeout handling
  - Updated selftest breakpoint function so it cannot be inlined or optimized away

Changes from v2:
  - Rebased to v7.0-rc1
  - Fixed warnings from checkpatch.pl --strict run

Changes from v1:
  - The patch adding the SBI extension and function IDs is already merged; this
    series builds on top of that
  - Added breakpoint selftest in tools/testing/selftests/breakpoints/

Specifications:
~~~~~~~~~~~~~~
The SBI debug trigger extension is specified in the SBI specification:
  https://docs.riscv.org/reference/sbi/v3.0/ext-debug-triggers.html

The Sdtrig ISA is part of the RISC-V debug specification:
  https://github.com/riscv/riscv-debug-spec

How to use:
~~~~~~~~~~~
OpenSBI:
  https://github.com/riscv-software-src/opensbi.git

QEMU:
  https://github.com/hschauhan/qemu/tree/hschauhan/sdtrig-icount-fix

Linux Kernel:
  Apply these patches on top of v7.4-rc1

How to test:
~~~~~~~~~~~
>From the Linux kernel directory, first install the UAPI headers (required on a
fresh tree so the compiler can locate <asm/ptrace.h> and the new
NT_RISCV_HW_BREAK/WATCH definitions via KHDR_INCLUDES):

  make headers

Then build the selftest:

  make -C tools/testing/selftests/breakpoints/

This produces breakpoint_test_riscv under the same directory. Load it on the
target and run. Sample output:

  # /apps/breakpoint_test_riscv
  # [perf_event]: Breakpoint test passed!
  # [perf_event]: Watchpoint test passed!
  # [ptrace]: Breakpoint test passed!
  # ptrace(PTRACE_GETREGSET): Number of watchpoints: 2
  # ptrace(PTRACE_GETREGSET): addr: 0x82888 control: 0x8080
  # [ptrace]: Watchpoint test passed!
  # [hbpregs] breakpoint readback: addr=0x10472 type=4 len=4 ctrl=0
  # [hbpregs]: Breakpoint test passed!
  # [hbpregs] watchpoint readback: addr=0x82888 type=2 len=8 ctrl=0
  # [hbpregs]: Watchpoint test passed!
  # Icount taken branch PC test passed!

Perf Test Suite:
~~~~~~~~~~~~~~~
Run these perf tests sequentially. On this perf tree, the watchpoint tests share
one watched variable and the default parallel mode can make the subtests
interfere with each other.

~ # /apps/perf test -S -v 16 17 18 19 20
 16: Breakpoint overflow signal handler           : Ok
 17: Breakpoint overflow sampling                 : Ok
 18: Event re-armed with PERF_EVENT_IOC_REFRESH   :
 18.1: Software event                             : Ok
 18.2: Tracepoint event                           : Skip (permissions)
 19: Breakpoint accounting                        : Ok
 20: Watchpoint                                   :
 20.1: Read Only Watchpoint                       : Ok
 20.2: Write Only Watchpoint                      : Ok
 20.3: Read / Write Watchpoint                    : Ok
 20.4: Modify Watchpoint                          : Ok

=== Test Summary ===
Passed main tests : 3
Passed subtests   : 5
Skipped tests     : 1
Failed tests      : 0

Himanshu Chauhan (8):
  riscv: Introduce support for hardware break/watchpoints
  riscv: Add breakpoint and watchpoint test for riscv
  riscv: add ptrace requests for hardware breakpoints
  riscv: add regset access for hardware breakpoints
  selftests/breakpoints: extend riscv test for ptrace hw
    break/watchpoints
  riscv: Add shared instruction fetch and decode helpers
  riscv: Add software supported single stepping with mc/mc6 triggers
  perf tests: keep bp_signal memory accesses visible

 MAINTAINERS                                   |   12 +
 arch/riscv/Kconfig                            |    2 +
 arch/riscv/include/asm/hw_breakpoint.h        |   78 ++
 arch/riscv/include/asm/insn.h                 |   16 +
 arch/riscv/include/asm/kdebug.h               |    3 +-
 arch/riscv/include/asm/processor.h            |   15 +
 arch/riscv/include/uapi/asm/ptrace.h          |   50 +
 arch/riscv/kernel/Makefile                    |    1 +
 arch/riscv/kernel/hw_breakpoint.c             | 1182 +++++++++++++++++
 arch/riscv/kernel/process.c                   |    2 +
 arch/riscv/kernel/ptrace.c                    |  661 +++++++++
 arch/riscv/kernel/traps.c                     |    6 +
 arch/riscv/kernel/traps_misaligned.c          |   52 +-
 arch/riscv/lib/Makefile                       |    1 +
 arch/riscv/lib/insn.c                         |  279 ++++
 include/uapi/linux/elf.h                      |    4 +
 tools/include/uapi/linux/elf.h                |    2 +
 tools/perf/tests/bp_signal.c                  |   14 +-
 tools/testing/selftests/breakpoints/Makefile  |    8 +
 .../breakpoints/breakpoint_test_riscv.c       |  867 ++++++++++++
 20 files changed, 3197 insertions(+), 58 deletions(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 arch/riscv/lib/insn.c
 create mode 100644 tools/testing/selftests/breakpoints/breakpoint_test_riscv.c

-- 
2.43.0


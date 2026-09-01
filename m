Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820B038B7B0
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270354; cv=pass; b=kfntI3z723/sRmhYemMUCeHxooAFY0tLwk/Qgd/tavrEx6MioBxYaKy/GSfiC3H9VPDOq0e8e7BrJiij3e4n3rA03/LxXIe8aE9p9phl1ffn9mDvV4Cbgy0c0gAFMmp54RHvcn1CSo0Vw19/ZyR9ff5vakAtDv/MHvlcB7ERSac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270354; c=relaxed/simple;
	bh=m4ZJ2+JsxPjKDDFJApIIceyD+SEE8DpWzuWpzoG0QTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/JKAH1534yXcmfBAAZz4EVopi5UPidCbV2B52dU/+/PnvgIAyBuJvWUDbi/vjYIiNF3tMBM8nd0tviiOr3MUkWMJ6Ea6d/DUtTXaTLQct8dza31mL9xk4eRmDbBlgtOWlYQOKdIjOLijCM9ZvMVIBNfVL865PmEEPBHXjdBOsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBb/jgcX; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBb/jgcX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c255acff671so678577166b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 06:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788270350; cv=none;
        d=google.com; s=arc-20260327;
        b=j8VXbiXBs7BpivN/3FgalQ3WMSSqWC3eyMF8QqXKD/Hunuwns41nL2rjjcB16fGJww
         M0BqO4/IEudbkRrb6jkUQFz5b5ZX/jEONYk70OjaiR3hwWa/4eFH4IwdsI83HMxJlJst
         w5yZJ5fxQEEJPPdt8EFxgd2s76ct3R4sJR7HltecURR9Gj8UyRYExB8U2PTysm7iMKzd
         Inp1j2D2hqvapLP1Geckkchh6Le3AaeiXzoXcEfOffAzdQ+KnA+SIQ6lF5wF/dgNW+ax
         isB7m/LYf4Zt3r8rScI2tGy7/unGs1B3nVgFQVlSalBDzc3n5WyQ2+mGnUPT+LU3ghyI
         XNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T+ww05w7mmoIv4vxq1+fWmu8KH4UmvjD9xsbmPma+uY=;
        fh=59PDurVCOKkxhjJJP4xL7kg/Yc+CtWxsPgAQsoghmok=;
        b=hM/qQccNZ5ire5pyFeVWwuIphRVncoJ21w6rr/tqzdJ4kNviDCe2m+8rrQutjjZFwO
         tY9suguRRHUcdFtkPffolGXDVQ5DchH21oYx6emGRZPYFuiFtIte3qclPmG3mxg4oeBV
         849PR3XHFHXpuYbjHWa+dPRmBosV2XNM2GDoH6lb9ayjwoHkYTewW7WR07OzRxvPIBSZ
         ihNcLz4CLFl6C+F6Mqkg6flRpk5XbfhVawEo04Q8BFqZijazZj1+4d/dX+hVPF2Tcbub
         wiRNyTBhhUmySj5zMyhkZ1r2M9Sp28MGEu4dVdf61W+y7WIyhFTr56lE1F7UNSNvimD6
         fg0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270350; x=1788875150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T+ww05w7mmoIv4vxq1+fWmu8KH4UmvjD9xsbmPma+uY=;
        b=RBb/jgcXo0OUzgltfHpvH9o4x4LGvOBmVNet89IIb3JZ7sak6WddtdiIAdBUC5mBGr
         SBks9ZmrIW/EL3Ld4wLaDkGw/de4tWMLirCO+cZEUCKhkFaL3qvmdAj2IhZfJxwZAszW
         QoFPkL2BHeaB4hQ3hvRiZwtfe1To+6YXdjcNgxqZWg2ZHHV2BhTCo290aewLEStkCZUe
         +MzsP/zYh6WsM6kH3TOHLF6XrA3JjZ09aHCIWq79807iRrfdE/tBAkARu/lHReb7EqJr
         Hkd6A9KUxFa2oUBu/QPfkvrxFu4WM1RXJxAFz+MlD2B/08+BqZ2VyaL78jCCGS0kYyc+
         XS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270350; x=1788875150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+ww05w7mmoIv4vxq1+fWmu8KH4UmvjD9xsbmPma+uY=;
        b=brNprfZAB1M3F3Vuy6uvnt+yCNUThdMaXKXlDylhdnIQwHzNu6frN08bUkotmf2mCw
         aTcxbtOVp3hNYlUwj648WqBsj/dUnfdDQth0PPMOOv85Dt2Pb+T3AeSGYM/+6S102OTT
         b0BlYeaF2PWOh1DYhDgMREeIn92lxDCkr0Ln+3XwcFHXq4zssl9fYB0dubB3wbtNoqYR
         I5TiNCOXXEIh8QsN3sAw8B9D48FNW5CJiPBoZa6IT8gG4zuSsjsEXdEi3/N6caeQN//9
         1MAeyq4/c4H0V4VSkSoCHqhKO0j0GRqzFhLQOx5CibalusBXI0jQ5iM3xEsRcrpLYbIG
         rDMg==
X-Forwarded-Encrypted: i=1; AHgh+RqQf5i5Vl62haT7trrn9m2azxlamwkSUqTKREv2tX3XDq8kePSVZ0vpXQJ9mtZK9T15GgtD27SHmz5ySEIsIg0=@vger.kernel.org
X-Gm-Message-State: AFuF++ldi51Jcw3fbfmHnvhyn9lncUTbjo3FbsxFSzW17XlxBJuBte86
	++QI0RyaYUfIlDuoBh0ZOkEeA5Gp6XuiEmk56Fan8lQFNL5VWbKtQBlcYvVjerf1K5x2Y053hU2
	HGppJcbgcDjveFtJ2ggDp0UqBV+KHT+M=
X-Gm-Gg: AR+sD11z72rN/oSc+2r4z0eUZOcAP/xFS+u9TabmUyc4SxE12OYm7SeKlg6CDQNfOqY
	kQVDzNs9juJx+89lK+YE55MEubs3OBIuSmV0pJl7ilEHK8oo5Skcvj082QtlJbeUJNvw7lIg2Q1
	P9OjIuX20fqlX5nfhwht6D8Ach07rEqJ0FDqh78HyTYMb42gj2LVl83QB3cK31ECdztcPE2BimK
	x5dicBtW8kyOWrZrs5XZqmrM/azQs6zN2ee8Dmb9xP4/T8/LkXxWZ7RG8sCuHTjoxpN6gB4/BVZ
	lsI2+jlyWRejOtUIlhLLFSRg4wBczFQFmpEXM41nK9JT3reGAUCYc+khNQEsuDbWw/3EgA==
X-Received: by 2002:a17:907:c01c:b0:c21:382e:9a38 with SMTP id
 a640c23a62f3a-c2556c18e20mr2310750866b.2.1788270349459; Tue, 01 Sep 2026
 06:45:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810164622.1829843-1-puranjay@kernel.org>
In-Reply-To: <20260810164622.1829843-1-puranjay@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 1 Sep 2026 15:45:35 +0200
X-Gm-Features: AcwNN1V-BSr9PbUGVMO7koykFLZgUeLcnwPUwQVqoGS2DmQVFtek6kPoYQ5CUiY
Message-ID: <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for bpf_get_branch_snapshot()
To: James Clark <james.clark@linaro.org>
Cc: bpf@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

Can you review this version of the patchset? It is implementing what
we discussed in the thread on the last version.

Thanks,
Puranjay

On Mon, Aug 10, 2026 at 5:46=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> Changelog:
> v5: https://lore.kernel.org/all/20260616155716.2631508-1-puranjay@kernel.=
org/
> Changes in v6:
> - Split the two perf/core patches out into their own series [3]. They
>   fix bugs of their own and do not depend on this one.
> - Add raw_local_daif_save() and raw_local_daif_restore(), so the
>   snapshot can mask exceptions without trace_hardirqs_off() evicting
>   the records it is about to read (new patch 1).
> - Rework the snapshot. Clear PMCR_EL0.E across the BRBFCR_EL1
>   read-modify-write so that a freeze cannot set PAUSED behind the saved
>   value, and unpause before restarting the counters, since a paused
>   BRBE cannot freeze for its own overflow handler (James Clark).
> - Skip the pause entirely when BRBE is disabled or already frozen, and
>   invalidate only when the snapshot was the one to pause it.
> - Run valid_brbe_version() before masking exceptions; the static call
>   is only reached from BPF programs, which run with migration disabled.
> - Fold cpu_has_brbe() into valid_brbe_version() and drop the
>   arm_brbe_ prefix from the snapshot callback (James Clark).
> - Derive the selftest skip threshold from the waste and hit limits it
>   depends on, so the two cannot drift apart.
>
> v4: https://lore.kernel.org/all/20260527121207.2312181-1-puranjay@kernel.=
org/
> Changes in v5:
> - Rework patch 2: drop the UAPI union. Instead rename the helper to perf_=
clear_branch_entry() and
>   clear the entry with a single
>         *br =3D (struct perf_branch_entry){ }.
>   This stays kernel-internal, with no changes to the uapi/ or tools/ head=
ers (James Clark).
> - Add an isb() to the BRBCR_EL1 =3D=3D 0 early-exit in the snapshot, for =
consistency with the other
>   two exit paths (bpf-ci).
> - Add Rob Herring's Reviewed-by to patch 3
>
> v3: https://lore.kernel.org/all/20260413185740.3286146-1-puranjay@kernel.=
org/
> Changes in v4:
> - Fix leaking branch records when scheduled task has an unrelated perf ev=
ent (Sashiko)
> - Update tools/include/uapi/linux/perf_event.h as well for patch 2
> - Introduce cpu_has_brbe() and use it in
>   arm_brbe_snapshot_branch_stack(0 to make sure we don't run on a CPU
>   without BRBE.
> - Add explicit isb() after after writing to SYS_BRBFCR_EL1.
> - Rebase on latest arm64 tree.
>
> v2: https://lore.kernel.org/all/20260318171706.2840512-1-puranjay@kernel.=
org/
> Changes in v3:
> - Move NULL pmu_ctx fix from arm_pmuv3.c to perf core (Leo Yan)
> - Use union to clear branch entry bitfields instead of per-field
>   zeroing (Leo Yan)
> - Remove per-CPU brbe_active flag; check BRBCR_EL1 =3D=3D 0 instead (Rob
>   Herring)
> - Remove redundant valid_brbidr() check in snapshot path (Rob Herring)
> - Introduce for_each_brbe_entry() iterator to deduplicate bank
>   iteration (Rob Herring)
> - Include perf core maintainers (Leo Yan, Rob Herring)
>
> v1: https://lore.kernel.org/all/20260313180352.3800358-1-puranjay@kernel.=
org/
> Changes in v2:
> - Rebased on arm64/for-next/core
> - Add per-CPU brbe_active flag to guard against UNDEFINED sysreg access
>   on non-BRBE CPUs in heterogeneous big.LITTLE systems.
> - Fix pre-existing bug in perf_clear_branch_entry_bitfields() that missed
>   zeroing new_type and priv bitfields, added as a separate patch with
>   Fixes tags (new patch 2).
> - Use architecture-specific selftest threshold (#if defined(__aarch64__))
>   instead of raising the global threshold, to preserve x86 regression
>   detection.
>
> RFC: https://lore.kernel.org/all/20260102214043.1410242-1-puranjay@kernel=
.org/
> Changes from RFC:
>  - Fix pre-existing NULL pointer dereference in armv8pmu_sched_task()
>    found by Leo Yan during testing (patch 1)
>  - Pause BRBE before local_daif_save() to avoid branch pollution from
>    trace_hardirqs_off()
>  - Use local_daif_save() to prevent pNMI race from counter overflow
>    (Mark Rutland)
>  - Reuse perf_entry_from_brbe_regset() instead of duplicating register
>    read logic, by making it accept NULL event (Mark Rutland)
>  - Invalidate BRBE after reading to maintain record contiguity for
>    other consumers (Mark Rutland)
>  - Adjust selftest wasted_entries threshold for ARM64 (patch 3)
>  - Tested on ARM FVP with BRBE enabled
>
> This series enables the bpf_get_branch_snapshot() BPF helper on ARM64
> by implementing the perf_snapshot_branch_stack static call for ARM's
> Branch Record Buffer Extension (BRBE).
>
> bpf_get_branch_snapshot() [1] allows BPF programs to capture hardware
> branch records on-demand from any BPF tracing context. This was
> previously only available on x86 (Intel LBR) since v5.16. With BRBE
> available on ARMv9, this series closes the gap for ARM64.
>
> Usage model
> -----------
>
> The helper works in conjunction with perf events. The userspace
> component of the BPF application opens a perf event with
> PERF_SAMPLE_BRANCH_STACK on each CPU, which configures the hardware
> to continuously record branches into BRBE (on ARM64) or LBR (on x86).
> A BPF program attached to a tracepoint, kprobe, or fentry hook can
> then call bpf_get_branch_snapshot() to snapshot the branch buffer at
> any point. Without an active perf event, BRBE is not recording and
> the buffer is empty.
>
> On-demand branch snapshots from BPF are useful for diagnosing which
> specific code path was taken inside a function. Stack traces only show
> function boundaries, but branch records reveal the exact sequence of
> jumps, calls, and returns within a function -- making it possible to
> identify which specific error check triggered a failure, or which
> callback implementation was invoked through a function pointer.
>
> For example, retsnoop [2] is a BPF-based tool for non-intrusive
> mass-tracing of kernel internals. Its LBR mode (--lbr) creates per-CPU
> perf events with PERF_SAMPLE_BRANCH_STACK and then uses
> bpf_get_branch_snapshot() in its fentry/fexit BPF programs to capture
> branch records whenever a traced function returns an error.
>
> Consider debugging a bpf() syscall that returns -EINVAL when creating
> a BPF map with invalid parameters. Running retsnoop on an ARM64 FVP
> with BRBE to trace the bpf() syscall and array_map_alloc_check():
>
>   $ retsnoop -e '*sys_bpf' -a 'array_map_alloc_check' --lbr=3Dany \
>              -F -k vmlinux --debug full-lbr
>   $ simfail bpf-bad-map-max-entries-array  # in another terminal
>
> Output of retsnoop:
>
>   --- fentry BPF program (entries #63-#17) ---
>
>   [#63-#59] __htab_map_lookup_elem: hash table walk with memcmp        (h=
ashtab.c)
>   [#58] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xc850           (h=
ashtab.c:750)
>   [#57-#55] ... dump_bpf_prog internal branches ...
>   [#54] dump_bpf_prog+0xcab8        -> bpf_get_current_pid_tgid+0x0    (h=
elpers.c:225)
>   [#53] bpf_get_current_pid_tgid+0x1c -> dump_bpf_prog+0xcabc          (h=
elpers.c:225)
>   [#52-#51] ... dump_bpf_prog -> __htab_map_lookup_elem ...
>   [#50-#47] __htab_map_lookup_elem: htab_map_hash (jhash2), select_bucket
>   [#46-#42] lookup_nulls_elem_raw: hash chain walk with memcmp         (h=
ashtab.c:717)
>   [#41] __htab_map_lookup_elem+0x98  -> dump_bpf_prog+0xcaf8           (h=
ashtab.c:750)
>   [#40-#37] ... dump_bpf_prog -> bpf_ktime_get_ns ...
>   [#36] bpf_ktime_get_ns+0x10       -> ktime_get_mono_fast_ns+0x0      (h=
elpers.c:178)
>   [#35-#32] ktime_get_mono_fast_ns: tk_clock_read -> arch_counter_get_cnt=
pct
>   [#31] ktime_get_mono_fast_ns+0x9c -> bpf_ktime_get_ns+0x14           (t=
imekeeping.c:493)
>   [#30] bpf_ktime_get_ns+0x18       -> dump_bpf_prog+0xcd50            (h=
elpers.c:178)
>   [#29-#25] ... dump_bpf_prog internal branches ...
>   [#24] dump_bpf_prog+0x11b28       -> __bpf_prog_exit_recur+0x0       (t=
rampoline.c:1190)
>   [#23-#17] __bpf_prog_exit_recur: rcu_read_unlock, migrate_enable     (t=
rampoline.c:1195)
>
>   --- array_map_alloc_check (entries #16-#12) ---
>
>   [#16] dump_bpf_prog+0x11b38       -> array_map_alloc_check+0x8       (a=
rraymap.c:55)
>   [#15] array_map_alloc_check+0x18  -> array_map_alloc_check+0xb8      (a=
rraymap.c:56)
>         . bpf_map_attr_numa_node       . bpf_map_attr_numa_node
>   [#14] array_map_alloc_check+0xbc  -> array_map_alloc_check+0x20      (a=
rraymap.c:59)
>         . bpf_map_attr_numa_node
>   [#13] array_map_alloc_check+0x24  -> array_map_alloc_check+0x94      (a=
rraymap.c:64)
>   [#12] array_map_alloc_check+0x98  -> dump_bpf_prog+0x11b3c           (a=
rraymap.c:82)
>
>   --- fexit trampoline overhead (entries #11-#00) ---
>
>   [#11] dump_bpf_prog+0x11b5c       -> __bpf_prog_enter_recur+0x0      (t=
rampoline.c:1145)
>   [#10-#03] __bpf_prog_enter_recur: rcu_read_lock, migrate_disable     (t=
rampoline.c:1146)
>   [#02] __bpf_prog_enter_recur+0x114 -> dump_bpf_prog+0x11b60          (t=
rampoline.c:1157)
>   [#01] dump_bpf_prog+0x11b6c       -> dump_bpf_prog+0xd230
>   [#00] dump_bpf_prog+0xd340        -> brbe_snapshot_branch_stack+0x0    =
 (arm_brbe.c:814)
>
>                    el0t_64_sync+0x168
>                    el0t_64_sync_handler+0x98
>                    el0_svc+0x28
>                    do_el0_svc+0x4c
>                    invoke_syscall.constprop.0+0x54
>     373us [-EINVAL] __arm64_sys_bpf+0x8
>                     __sys_bpf+0x87c
>                     map_create+0x120
>      95us [-EINVAL] array_map_alloc_check+0x8
>
> The FVP's BRBE buffer has 64 entries (BRBE supports 8, 16, 32, or
> 64). Of these, entries #63-#17 (47) are consumed by the fentry BPF
> trampoline that ran before the function, and entries #11-#00 (12)
> are consumed by the fexit trampoline that runs after. Entry #00
> shows the very last branch recorded before BRBE is paused: the call
> into brbe_snapshot_branch_stack().
>
> The 5 useful entries (#16-#12) show the exact path taken inside
> array_map_alloc_check(). Record #14 shows a jump from line 56
> (bpf_map_attr_numa_node) to line 59 (the if-condition), and #13
> shows an immediate jump from line 59 (attr->max_entries =3D=3D 0) to
> line 64 (return -EINVAL), skipping lines 60-63. This pinpoints
> max_entries=3D=3D0 as the cause -- a diagnosis impossible with stack
> traces alone.
>
> [1] 856c02dbce4f ("bpf: Introduce helper bpf_get_branch_snapshot")
> [2] https://github.com/anakryiko/retsnoop
> [3] https://lore.kernel.org/all/20260810133540.1947118-1-puranjay@kernel.=
org/
>
> Puranjay Mohan (3):
>   arm64: Add raw variants of local_daif_save() and local_daif_restore()
>   perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
>   selftests/bpf: Adjust entry thresholds for ARM64 BRBE
>
>  arch/arm64/include/asm/daifflags.h            |  41 +++++-
>  arch/arm64/kernel/suspend.c                   |   7 +-
>  drivers/perf/arm_brbe.c                       | 135 ++++++++++++++----
>  drivers/perf/arm_brbe.h                       |   9 ++
>  drivers/perf/arm_pmuv3.c                      |   5 +-
>  .../bpf/prog_tests/get_branch_snapshot.c      |  28 ++--
>  6 files changed, 175 insertions(+), 50 deletions(-)
>
>
> base-commit: 03a2e393994ca27567fe060e066806589c547fbc
> --
> 2.53.0-Meta
>

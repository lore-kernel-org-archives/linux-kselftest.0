Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D540F349CDD
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417804; cv=pass; b=NYKDJMZKcTj3K8PGubUnvKuvgCNHWl4uisi1vvsLGAoIsoiE6V+DsTVDOtckYQPS1JCIQljFXqYfnMoQoKcyxZKFeoAuyC5+oODsWT02nwgVeQ0N/SpZexf11epbmk1HGnfFtYS5gMSpn5YlZKyGDNKWobGptgT9w6mJfZ30XCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417804; c=relaxed/simple;
	bh=DlFYvFJLECsxFthzw/eFkvSmzedTUmwOpzdBKfUM0K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNfyDUqlH9XyG4hKgsN/k39GRALd1AeJ9YYs7RuXgxSjLMr4tEfN9C63Tiq53NDhyUKRL4WIxDrXoH/nzbnLnb48a2EedrwcZOxed3JSSs0Y2U27Y+14uIrqBbfUcRmrQ7g2pSc/9yE8P6CQpE/WHnBYPNKNyyPYgit1AyRiD8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFrqVxqy; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFrqVxqy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c294ad260fdso263203166b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 03:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790417801; cv=none;
        d=google.com; s=arc-20260327;
        b=ki3Gy9Mz/YcTO32Mla7m/65ic3TSsKjWjZ0n6OVPWQK106CP1LeeOfbXan0AJIDZa5
         EmImatDQ9WihnBdx3sxtRMk7pU7b+e2QQDfbAZYHPZpGb4lOmrX241rW6UX6u8R+z2QS
         dPO+H+y7PUIwDI5i9Khj09Z/B1dHTGzQ0Pl9wZAFN2Y+Pw3I/i6Kkdl1HUtJf3dmdt8Z
         /YkGcAcYbnva68jZaFE3be5l2USjwV9JN4+ZETQt4B42s35aKVJKc+FZpnMsGq4ke46D
         /k92EHtXqa9Q2QZZ1zBc/9qCXXYlMlPF2OzR/+pdzAd2maL728n5s+fxGsEJ/Iispdh5
         DJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
        fh=3wN6Twh5/MZOYDjSck7C4fXpH2i6BQmSl1fqhjFey9M=;
        b=E7EPgBaX7HRXYZuXFmKK2ph0UXtH/vJLE326+TSsUJsAwKbuP114XDOLOnRfIK2HDn
         9kxb4PY9tcZMtJyt+I+rQ/KgPibXMASLbuaie7HsPslyTv/lV8MMmwUiT7m9qrJFb4EN
         oArLzQNy1nSj3xnx/hA1UdvTcjWd8pu8T5H6gfseIz3jjA5E/mmmM363qUVKhZ3ZDUGm
         6nYKq+Wm4JipJvjFwJgkzVlsMRvgRGq1rdQd4kAbaOG8MfqaAXmra/huK2YLRm+M939/
         MRt1p3nCO20CEnR+G2C22xaAoyCQq3yobGP43RocMTshqQ2Eam4dJqahi426zfOOpNOB
         EZpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417801; x=1791022601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
        b=LFrqVxqyv19kzRnHMAXhI4vAik/aMNgEsVTx/84IesLwhxI7w5kcphx7vTNr58KQP0
         LglTxfx1s/rQs1AxvYmLUpRQYCm2Lp7Cv9igFQ3wNeNpzNemzkmJgb5lUXceKTbkEQVd
         ue6Dy28OjDCgXTKFM5d28OCJ4CmegTTe7AkpBS0HofQ2GN6ZXBBWEta+Hvf77O5qRFzD
         ce1oQxToFYp3oIinFdBqmrJeoNzqadISTAz4RAGHvggGMaepTGJTGQRZvoh/Luu6kQML
         1j/tz19Go6qEO5Ku5KMz7XjE3W5VfNjj2Vff7qdjtUbY41Uo3UXOsM5oWg9RJorWKQTh
         7Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417801; x=1791022601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
        b=zYY3cPwD70QLmguXQfDJU1tmLJqbyhnyQorrQIG9HFiM3MeY6kckyQrMj4TL8a0S9K
         1s0IXSebhH6yWwg9BA3iPTtKQpg60TwLxRwZJQQpYTeII5KgX0BioEPX8fWtFHu40u7g
         o9x1BVbUTbPwGKPZdSkKKeecaBJ6dVmoH0Lgu4BTsiJ2K3jfazldDOdrOR908a9cRBTI
         u/LbCpH6aHDrqMbrGh3CvRN2WghM9Ax3Ohq/mL5KqwhGA2/hiTSfDHvL82HgUiNsvjkn
         zAtVoxyV0yV9aoc+29gkj69bVmb0Roc59r0KFtEbbEt0x0PIOm4dOGJ00oKJX3XOd46j
         ABCw==
X-Forwarded-Encrypted: i=1; AKwUvByBV2+sPOQojMvb/yEaUw96Ux616lWUIH6TEni7szPcOuB9uK+SVqlVaw2477LRQuJH3NjQpSUpHe01YWu2fkU=@vger.kernel.org
X-Gm-Message-State: AFuF++kYRWPBtDipKrrwVAb2zpZhIQ12ld/y2a6fRSIKSJBGkxZtHNUv
	VpDjWtYD9iGOd+U34rcZUay/LMZ6InWIjCQZImrKD7onO5j6bDF0PClX2W1fAWM8gJ8g4nX8Yud
	qadd5FUuhCx7z2tBh/DFpoDos71t6l/A=
X-Gm-Gg: AYBFou3EI+qsxBgvhXlIQ45gczpaa/Hk3UiB3NE48TSAGvcJU3z0Lyif+BGQQVZba3t
	RsAbsICp+kDXtXCcKndP915FF6qWcRneZwL5ocq45AZ7gKN60Bi+Z8iV192fbo/TW/yuC77IuuV
	zSrxRlWgNOTUbu57AbwcIO63Y2hRvwI51E9VBCoPOV2B42iQ9CAbwzTZ042L5dPjmTqzzmDqnQs
	j0A4QtSZYurN3/q3gJSLixNjyJGtOf/1HfAEjjIjqZbmrQpKKHwE+2rWrWiRVeKZGyLmXt8IJra
	9FgFY3izgOCOaV6we4o/leim+0xP06DWMDSjq85cwYwYusQATXniv9OppSV25MqZ0tMI6C6u3rm
	30C/QkSMJ0Uo=
X-Received: by 2002:a17:906:dc89:b0:c26:3341:b8f6 with SMTP id
 a640c23a62f3a-c2ac23a79a0mr705591166b.31.1790417800888; Sat, 26 Sep 2026
 03:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 26 Sep 2026 18:16:03 +0800
X-Gm-Features: AclHuK-9Dsy7rrAClr-629S5BXo_K2Hom1PYuYOl9rMJseRXC4FOvcoZCXsi7Gw
Message-ID: <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, Barry Song <baohua@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 12:55=E2=80=AFPM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> This RFC adds offload-only swap areas for deliberate cold-page offload to
> backends unsuitable for pressure reclaim. ZFS zvol swap has documented
> deadlocks under memory pressure [3]; compressed swap is another target
> because writes may need memory despite free logical slots.
>
> Explicit proactive reclaim can use these areas alongside conventional
> swap, ordered by priority. Ordinary reclaim cannot initiate non-zero
> writes to them, including through retained swap entries. Conventional
> capacity is not reserved for emergencies. Operators choose the policy;
> the kernel does not measure headroom or make an allocating backend safe.
>
> TMO/Senpai [4] and DAMON_RECLAIM [5] are related cold-page reclaim
> approaches. This RFC admits offload-only swap through memory.reclaim and
> per-node reclaim, but not DAMON. Other related work includes per-cgroup
> zswap writeback control [6], Virtual Swap Space v4 [1] and swap tiers v10
> [2].
>
> The util-linux companion [8] proposes swapon --offload-only and an fstab
> option. Older swapon silently ignores the fstab token, so persistent
> activation needs discussion. Apply the separate i915 fix [9] first to avo=
id
> a pre-existing folio-lock leak when shmem writeback is skipped.
>
> The series fixes zram selftest device tracking and error reporting, adds
> the swap policy with DRM eligibility checks, and tests routing, workingse=
t
> activation and retained-entry write refusal. It is based on mm-new at
> 995829088503.
>
> Feedback is particularly welcome on:
>
> - Activation-time eligibility versus backend placement or migration:
>   is retained-entry refusal, with possible reclaim churn or OOM,
>   acceptable without migration?
> - Eligible-capacity accounting, including overcommit limits and OOM
>   scoring; cache recovery, cluster invalidation and workingset activation=
.
> - Persistent activation and visibility: current swap listings do not
>   expose the policy.
>
> Validation includes x86 builds, affected arm64 MTE objects and builds
> without swap or memory cgroups. QEMU tests covered routing, retained-entr=
y
> recovery, data integrity and cleanup, with negative controls for write
> refusal and teardown failure.
>
> I have also been using this policy on my own machine with experimental
> bcachefs swap support, with no problems observed so far. Deliberate stres=
s
> testing is confined to VMs; I do not deliberately stress-test this machin=
e.
>
> Changes since v1, incorporating Sashiko's public review [7]:
>
> - Improve selftest isolation, retained-swap measurement and memlock skips=
.
> - Track allocated zram devices, wait for udev probes and report cleanup
>   errors without deleting data through a mount that could not be released=
.
> - Clarify activation, capacity reporting and conventional fallback limits=
.
>
> [1] https://patchew.org/linux/20260825153238.2695446-1-nphamcs@gmail.com/
> [2] https://patchew.org/linux/20260713025644.170839-1-youngjun.park@lge.c=
om/
> [3] https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.=
html#using-a-zvol-for-a-swap-device-on-linux
> [4] https://engineering.fb.com/2022/06/20/data-infrastructure/transparent=
-memory-offloading-more-memory-at-a-fraction-of-the-cost-and-power/
> [5] https://www.kernel.org/doc/html/latest/admin-guide/mm/damon/reclaim.h=
tml
> [6] https://www.kernel.org/doc/html/latest/admin-guide/mm/zswap.html
> [7] https://sashiko.dev/#/patchset/20260914104501.3960616-1-matthias.goer=
gens@gmail.com
> [8] https://github.com/util-linux/util-linux/pull/4633
> [9] https://lore.kernel.org/all/20260914105606.3997649-1-matthias.goergen=
s@gmail.com/
>
> v1: https://lore.kernel.org/all/20260914104501.3960616-1-matthias.goergen=
s@gmail.com/
>
> Matthias Goergens (4):
>   selftests: zram: track owned devices and report cleanup failures
>   mm: restrict offload-only swap to proactive reclaim
>   selftests: zram: cover offload-only swap policy
>   selftests: zram: cover retained offload-only entries
>
>  Documentation/mm/swap.rst                     | 105 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |   2 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   6 +-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c        |   2 +-
>  drivers/gpu/drm/panthor/panthor_gem.c         |   2 +-
>  drivers/gpu/drm/ttm/ttm_backup.c              |   2 +-
>  drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
>  include/linux/swap.h                          |  29 +-
>  include/linux/vm_event_item.h                 |   1 +
>  mm/memcontrol.c                               |  20 +-
>  mm/page_io.c                                  |  24 +-
>  mm/swapfile.c                                 | 123 ++++-
>  mm/vmscan.c                                   |  31 +-
>  mm/vmstat.c                                   |   1 +
>  tools/testing/selftests/zram/.gitignore       |   2 +
>  tools/testing/selftests/zram/Makefile         |   4 +-
>  tools/testing/selftests/zram/README           |  20 +-
>  tools/testing/selftests/zram/config           |  10 +-
>  tools/testing/selftests/zram/settings         |   1 +
>  tools/testing/selftests/zram/swap_offload.c   | 425 +++++++++++++++++
>  .../selftests/zram/workingset_offload.c       | 207 ++++++++
>  tools/testing/selftests/zram/zram.sh          |   9 +
>  tools/testing/selftests/zram/zram01.sh        |   9 +-
>  tools/testing/selftests/zram/zram02.sh        |   9 +-
>  tools/testing/selftests/zram/zram03.sh        | 174 +++++++
>  tools/testing/selftests/zram/zram04.sh        | 164 +++++++
>  tools/testing/selftests/zram/zram05.sh        | 447 ++++++++++++++++++
>  tools/testing/selftests/zram/zram_lib.sh      | 189 ++++++--
>  28 files changed, 1926 insertions(+), 94 deletions(-)

Hi Matthias

That's a lot of changes for a rather limited usage. IIUC what it want
to archive is, for different kind of reclaim, swap operations should
only go to certain devices?

This really sounds like another usage of the swap tiering design: A
default per-cgroup tier setup, and a one time tier limit during
proactive reclaim.

Just like we already have a "swappiness=3D" parameter in the reclaim
interface, perhaps adding a "swap.tier=3D" would be better and much
cleaner to achieve the same goal? Based on Youngjun's work here:
https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/

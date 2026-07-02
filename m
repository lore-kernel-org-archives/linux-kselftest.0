Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A60539023D;
	Thu,  2 Jul 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981685; cv=none; b=sP2eRMYNIFG0WHHQYsqlsRI2cTVuxO/NRW/BGxT0U/NbVbvKau5XD72asDxg5VdPY/xmJxeiPrpRaSRzR2QJpjWXrjUmGEV7ARIpYqG2QEMq6YungxmhRWCYjMxUngy6X5hGR9gwOJGX45lpXf1kVTvkQwXhUe8ZQ/nWjKVJGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981685; c=relaxed/simple;
	bh=uS6H1vybufcMrBzGVlLAS12K/WELMyHonKhkW+GOS80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTMhkiHciDyOqdB+F/PwqKkHc0s9f4EXFX94Kqxena6c1lzZIu5t1De63LbuhzyoxMs1z8c4tDSQE7lw58XNK5Ia6TgBeA35hOWwDDAzZFqs9Nl4wvUr1TdZVm/mlJDLTB9M/+FwM1qAcoQWHDhazs3z3hICVTKg+UzRv+pMLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kB2kuRdJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kB2kuRdJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1B34288E;
	Thu,  2 Jul 2026 01:41:18 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6CE73F905;
	Thu,  2 Jul 2026 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782981683; bh=uS6H1vybufcMrBzGVlLAS12K/WELMyHonKhkW+GOS80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kB2kuRdJqhIAttHXCAg7EFBcrsfkbhYc53SncoZGkDjDWwWp9hilj9K9DtXj1wgNN
	 hx3HFk9kGusTD0jJM90czwcBLOJRxHISYIKMl2cDB9PWJeX902Sbkj0prh7chT/6rN
	 Lrv5y/e3hB+HkWtbNxay5a5Q4kNkRoyHC7ZdIJuU=
Date: Thu, 2 Jul 2026 09:41:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] selftests/mm: test kmemleak's N-consecutive-scan
 leak confirmation
Message-ID: <akYkKgWOsYnw6ETE@arm.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-2-ab28f7cc0971@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-kmemleak_twice-v1-2-ab28f7cc0971@debian.org>

On Fri, Jun 26, 2026 at 08:52:03AM -0700, Breno Leitao wrote:
> --- /dev/null
> +++ b/tools/testing/selftests/mm/ksft_kmemleak_confirm.sh
> @@ -0,0 +1,111 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Functional test for kmemleak's N-consecutive-scan leak confirmation
> +# (the min_unref_scans module parameter).
> +#
> +# kmemleak only reports an object once it has stayed unreferenced for
> +# min_unref_scans consecutive scans. The default of 1 reports on the first
> +# scan (historical behaviour); higher values filter transient false
> +# positives where a live object's only reference is briefly invisible to a
> +# single scan (e.g. an RCU tree update in flight while the scan runs). The
> +# test loads samples/kmemleak's helper module to create orphan allocations
> +# and, counting only those orphans (matched by their [kmemleak_test]
> +# backtrace so unrelated leaks already present on the system are ignored),
> +# checks that:
> +#   - min_unref_scans=1 reports them on the first scan,
> +#   - min_unref_scans=2 reports nothing on the first scan but does on the
> +#     second,
> +#   - the parameter reads back what was written.
> +#
> +# The "nothing on the first scan" check is the core regression test: with
> +# min_unref_scans=2 no object can be reported in fewer than two scans. Like
> +# ksft_kmemleak_dedup.sh, if the module yields no detectable orphan at all
> +# in the running environment the test skips rather than failing.
> +#
> +# Author: Breno Leitao <leitao@debian.org>
> +
> +ksft_skip=4
> +KMEMLEAK=/sys/kernel/debug/kmemleak
> +PARAM=/sys/module/kmemleak/parameters/min_unref_scans
> +MODULE=kmemleak-test
> +AGE=6		# seconds; must exceed kmemleak's 5s minimum object age
> +
> +skip() { echo "SKIP: $*"; exit $ksft_skip; }
> +fail() { echo "FAIL: $*"; exit 1; }
> +pass() { echo "PASS: $*"; exit 0; }
> +
> +[ "$(id -u)" -eq 0 ] || skip "must run as root"
> +[ -r "$KMEMLEAK" ] || skip "no kmemleak debugfs (CONFIG_DEBUG_KMEMLEAK)"
> +[ -w "$PARAM" ] || skip "min_unref_scans module parameter not present"
> +modinfo "$MODULE" >/dev/null 2>&1 ||
> +	skip "$MODULE not built (CONFIG_SAMPLE_KMEMLEAK)"
> +
> +# kmemleak can be present but disabled at runtime (kmemleak=off boot arg,
> +# or it self-disabled after an internal error); a "scan" then returns
> +# EPERM. Probe once and skip if so.
> +echo scan > "$KMEMLEAK" 2>/dev/null ||
> +	skip "kmemleak is disabled (check dmesg or kmemleak= boot arg)"
> +
> +prev=$(cat "$PARAM")
> +# shellcheck disable=SC2317  # invoked indirectly via trap
> +cleanup() {
> +	echo "$prev" > "$PARAM" 2>/dev/null		# restore the parameter
> +	echo scan=on > "$KMEMLEAK" 2>/dev/null		# re-enable auto scan
> +	rmmod "$MODULE" 2>/dev/null
> +	echo clear > "$KMEMLEAK" 2>/dev/null
> +}
> +trap cleanup EXIT
> +
> +# Stop the automatic scan thread: only our manual scans should advance an
> +# object's consecutive-unreferenced run. An auto scan landing between two
> +# manual scans would change the result and make the test flaky.
> +echo scan=off > "$KMEMLEAK" 2>/dev/null
> +
> +# Create a fresh, aged set of orphan objects from the helper module's init
> +# path (its kmalloc/vmalloc/percpu allocations are dropped right away).
> +# Pre-existing reported leaks are greyed first ("clear") so only our
> +# orphans are counted. The module is left loaded on purpose: once it is
> +# unloaded its symbols are gone, so the orphan backtraces no longer resolve
> +# to [kmemleak_test] and could not be matched below.
> +gen_orphans() {
> +	rmmod "$MODULE" 2>/dev/null
> +	echo clear > "$KMEMLEAK"
> +	modprobe "$MODULE" || skip "failed to load $MODULE"
> +	sleep "$AGE"
> +}
> +
> +scan() { echo scan > "$KMEMLEAK"; }
> +
> +# Number of helper-module orphans currently reported by kmemleak. Matching
> +# the module's own backtrace ([kmemleak_test]) keeps the count immune to
> +# unrelated leaks on the running system. kmemleak only lists an object here
> +# once it has been reported, so this reflects the confirmation gating.
> +count_orphans() {
> +	c=$(grep -c '\[kmemleak_test\]' "$KMEMLEAK" 2>/dev/null)
> +	echo "${c:-0}"
> +}
> +
> +# 0) the parameter reads back what was written.
> +echo 3 > "$PARAM"
> +[ "$(cat "$PARAM")" = "3" ] || fail "min_unref_scans did not read back as 3"
> +
> +# 1) min_unref_scans=1 (default): orphans reported on the first scan. This
> +#    also establishes that the helper produces detectable orphans here.
> +echo 1 > "$PARAM"
> +gen_orphans
> +scan
> +first=$(count_orphans)
> +[ "$first" -gt 0 ] ||
> +	skip "$MODULE produced no detectable orphans (cannot test min_unref_scans)"
> +
> +# 2) min_unref_scans=2: nothing reported after the first scan, reported
> +#    after the second. The first-scan-zero check is the core regression.
> +echo 2 > "$PARAM"
> +gen_orphans
> +scan; s1=$(count_orphans)
> +scan; s2=$(count_orphans)
> +[ "$s1" -eq 0 ] || fail "min_unref_scans=2: $s1 orphan(s) reported after the 1st scan (must be 0)"
> +[ "$s2" -gt 0 ] || fail "min_unref_scans=2: no report on the 2nd scan (false negative)"
> +
> +pass "min_unref_scans=1 immediate; =2 gated to 2nd scan (counts $first/$s1/$s2); param read-back ok"

Are these off by one? Kmemleak has a mechanism to detect live objects
via the checksum. A side effect is that on allocation, the checksum is 0
and only after the first scan the checksum is changed. On checksum
mismatch (i.e. the first scan), we mark the object gray temporarily and
won't increment unref_scans. So we already have an implicit two scans
required to report an object as unreferenced during its early life.

I think this test needs a priming scan to update the checksums followed
by the actual check for min_unref_scans (with scan=off, otherwise random
scanning will skew the results).

-- 
Catalin

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373892D838E;
	Mon, 31 Aug 2026 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161444; cv=none; b=Ogr8409qoEEyXhCC3Op5zA0zsA4/lFsgnOkeR5q7UeOjqq9x4N8Axt/3iIdOOXu1TY9wyF8bkDfEEtJTOeviryPnn8gbbYn3NTSifr7WmZmzlSswfllwdCOkqPe+baAixGtR8uxWwJeymzGV0fH1YFyH3C+SpugEFIVXI/hEa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161444; c=relaxed/simple;
	bh=Q+IuMSlpQzt2kZCTJZXgjd64tnopR9oFjZyuOJCKVNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFcOalGUtpoZko/bgwYqV/FrWE4hcKjg60Tey6HIqpzKL2WGxssM4pNy6Or2GF2rxHuPm0pPjnqKrjPHJ06LTwvP9VyH7XHEhgum1hRPXlVg2312CV8qlFA7UqN9eAtUMW5hkaeE3p3Z1/Cndt/CeP8lE7nJXYi1WPzE9wZP9bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0Jau098; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0Jau098"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788161443; x=1819697443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q+IuMSlpQzt2kZCTJZXgjd64tnopR9oFjZyuOJCKVNg=;
  b=j0Jau098bY0IwqmGO22bnJJTMGzyxVBY/fClfJLm9Fd9pSNJ72f0yROA
   6Bpk6QAAY3vYb1bi86tSiCLtcbXfUlLiaZExyTdbJZ01ysm1s3Ga4zwQE
   PNHFc571zAb58rD2KfcwJ85my8jYAHJh0oKks4CMzshf6HTeP0Q60t1pO
   cD2llaVWPFq8pNx8JO6xNmki5xDn73HkktFKv+S0vz3Ugq4TzgTo6JfdO
   h+0pAwGYbq7T6DB4HMb/ZaykCfPFuMYLElxVZAVxSLitW1u5XUKta/nLn
   I3ojcI3bJmTUkyMEHUKBaVFGoZPQgMU0/ZZvqP7gYZ4yAvU9qLDa+nziF
   A==;
X-CSE-ConnectionGUID: VtN56IAGS0GyB9381yR3Sw==
X-CSE-MsgGUID: +5bSnh3ARWuwjBqeKqz1eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99160569"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99160569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:30:42 -0700
X-CSE-ConnectionGUID: CuvcaCpmS0uo8MoLP33PQQ==
X-CSE-MsgGUID: sVvopwRsQTW9Nzt0o+Uqog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272514915"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:30:39 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com,
	shuah@kernel.org,
	bestswngs@gmail.com,
	uladzislau.zhauniarovich@gmail.com,
	hdanton@sina.com,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net/sched: taprio: catch up in bounded time when the schedule falls behind
Date: Mon, 31 Aug 2026 15:30:25 +0800
Message-ID: <20260831073025.409831-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824185335.2703968-1-kuba@kernel.org>
References: <20260824185335.2703968-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 24 Aug 2026 11:53:35 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> No Link: tags present in the commit header.

v3 will carry the syzbot tags, including a fourth bucket akpm had syzbot
test this patch alone against:
https://lore.kernel.org/all/6a936ec2.4d659fcc.734b4.0032.GAE@google.com/

> has a second exit condition (--budget), so taprio_catch_up() can return
[...]
> jump makes end == now, and the strict ktime_before(end, now) test then skips

Right. v3 treats end == now as behind, in the walk and its caller, and
the comment mentions the cap.

> case, so a large gate control list turns a previously O(1) critical section
> into an O(num_entries) walk over separately allocated entries.

One lap at most per hold now, versus no bound at all before. Leaving it
as is.

> inoperative. Adding N * cycle_time then shifts the timeline by
> (N * cycle_time) modulo the interval sum, and the gate_close_time[] values

Yes. v3 jumps whole laps instead: min(cycle_time, sum of intervals) on
the entry timeline, cycle_time on cycle_end_time, i.e. exactly what N
restarts of the current code do.

> then terminates on budget exhaustion with end < now, and behind stays below
[...]
> changelog describes does not converge at all. Is the intent that this patch
> depends on the minimum interval patch for the bound to hold?

No. With the jump in laps the residual is under one lap, so the walk
finishes within num_entries steps for any schedule. v3 drops 2/3 anyway.

> be observed torn, which is also pre-existing. Is it worth a comment that
> advance_sched() may legitimately update the currently published entry?

Yes, will add.

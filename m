Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501421;
	b=LbiKHslrPdXFVYgglJXV6mgFy7s0AnlEPn5hKWJ6LHZNDSuvmxusZ7CBIUajY63jw7Q0
	 JxJ9Af7gtFvnbZfit/pgHPj+PCv4Aw3d8KNcKo7cYUCq5n+K/2YlXmEhxv97nfM8/7VbS
	 9p/4i5K4yorSye63LwC6QX75BNj75LBnzMhmAn1djZk71iL/BGRlRC3oVyIZo79Q8grLW
	 gmoKYtGnpGzdMBxMKmPCeV6mGuKgogSRxFyjrltzvvZySPIOJ5eWnF8wZX4ymQk3+mnmx
	 Sj5IikqFKh7kxArogFUGp+xKwsGNdMGtQRT9W8Jhli6wzeecdh85LEKE5ZUwD2gPm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501421;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NSJGplPu1Msrv6zdYcMiVn5VnLLt7su/CQr95c18W3Y=;
	b=RQBC+gCFLKIZH0x8R/MwMzWvTXVz98t5J4E7y0Ud35603cHU1PVNuzdm/ahU3Fd8AcKf
	 nusLaQz2nKhgT6w5bC+t5GrpepnS7bGUGqWdSyLvg9ms6oUBT0K0KIVMtEp4mRdh2jFzF
	 rbmNHK1edlzdygpP20I7/PZwQIJY1l3i5AYtyMnO5puz8p9G+bskqB/iF8rJGry7LY98p
	 XhWQ2k72EQWK394Gn0mCA2/5+PPyESB2gYXWxJB8o5tNaEc3Q3945ImV+gFQvbWvy/iHU
	 PhFqAP3CTmLfosf7nGtt/Lx8sg+9PM9aVbNMjmpAPfySmriQMTyRJy0H0gYlmT0j5FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.14
Received: from mta1.migadu.com (out-14.mta1.migadu.com [95.215.58.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D8660A2616
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 13:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D8660A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9hZxtAzG8ahfMEntD8SWhMlX/Nn8hOWANWQadkaJC1E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792501417; v=1; x=1793106217;
 b=c9+JdB4EKcvCUOY5aQX6T3oO+vjfIgZYqh8vEC1oTxAaTnMkJmShFQV2KYpZgmkSxoVMvSo1
 en/PPusKr7rmaz1aXEis7cNei/epmXSIuyk34+dpLZvHgK6TO7CgynnYBdUiGg5KfJ9weqoIzBl
 3JabIhKKjEGx5cRKa5t35qnI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 225c19738607e48d;
	Tue, 20 Oct 2026 13:03:36 +0000
X-Mizu-Trace-ID: 225c19738607e48d
X-Migadu-Flow: FLOW_OUT
Message-ID: <23fa4413-83b0-45b2-b790-1bae653e3e95@linux.dev>
Date: Tue, 20 Oct 2026 21:03:30 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, axboe@kernel.dk, shuah@kernel.org,
 tom.leiming@gmail.com, yukuai@fygo.io, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/4] nbd: revalidate startup state after queue updates
To: Jackie Liu <liu.yun@linux.dev>, josef@toxicpanda.com
References: <cover.1792399225.git.liuyun01@kylinos.cn>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <cover.1792399225.git.liuyun01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jackie,

在 2026/10/19 16:42, Jackie Liu 写道:
> Commit 8b428f42f3ed ("nbd: fix lockdep deadlock warning") drops
> config_lock around blk_mq_update_nr_hw_queues(). The initial checks for a
> running device and NBD_FLAG_CAN_MULTI_CONN can become stale while the
> lock is dropped.
> 
> Two NBD_DO_IT callers can both pass the PID check. After the first caller
> starts the device, the loser overwrites nbd->pid before failing to create
> the existing sysfs pid attribute. Concurrent NBD_SET_SOCK or NBD_SET_FLAGS
> can also leave multiple connections without NBD_FLAG_CAN_MULTI_CONN,
> which the queue-count retry does not validate.
> 
> Recheck both conditions after reacquiring config_lock. Reject an already
> started device with EBUSY, and reject unsupported multiple connections
> with EINVAL before retrying the queue update or starting receive workers.
> 
> Each fix is followed by its regression test. The tests prime the hardware
> queue count before each attempt and use socket pairs, so no external NBD
> server is needed. They require CAP_SYS_ADMIN, at least two online CPUs
> and unused NBD devices. 

Tested this series on top of next-20261019 (x86_64 KVM guest, 8 vCPUs),
building and running the new selftests in-guest with nbd loaded as a
module (nbds_max=4 max_part=0).

On the unpatched kernel both bugs reproduce at round 1: the losing
NBD_DO_IT caller exits with errno=17 (EEXIST) and /sys/block/nbdX/pid
reports the loser's pid, and nbd_multi_conn flags both the socket-added
and flags-changed variants ("invalid second receiver").

With the series applied, nbd_pid_race and nbd_multi_conn pass 100
rounds per case with seeds 123 and 456 - every round rejected with
EBUSY/EINVAL, no regressions, dmesg clean.

Tested-by: Tao Cui <cuitao@kylinos.cn>

Thanks,
Tao

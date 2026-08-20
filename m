Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C568C1F;
	Thu, 20 Aug 2026 02:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787192755; cv=none; b=PwpqH3tsgjQCgWWXYkd/dREI6ApVkxLjR2Fcz81kvJdRNqzJExpg6ViCNWGFYvEc/rerVH1m878sX396p2ZGvXO8eu7x264E5j/WpDYI9stXQcAGs8UDtaicSFDYmjh/D8rruLjSVXaMjt1ABQv7j5SKsbSnVM3wLEE2XtdTqeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787192755; c=relaxed/simple;
	bh=G1aNzQ61Xg9nDO12DPaQVgM6VrDP7HBD3mHQEeyLeZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkTm8HK1VvNXwkDlo1cA0ZfRSC92fKXkkwIhU/4cUXTL4IZs7JTUOzNCDN9AbNw+oyJuVZ3aL0qETAXA6qAwrbUGV3owiNf78ErXT8lJ0td5ekhDVs0E6fl8rIHfX8BadIADtXXbed0seHCyXjM/9+6qbvj2CsHZkla9dQnnX7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDqDOyVQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDqDOyVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787192753; x=1818728753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1aNzQ61Xg9nDO12DPaQVgM6VrDP7HBD3mHQEeyLeZw=;
  b=nDqDOyVQgRFKerPggmgctHUdCq35rmH0AwDKk6CbPcWT22Mp2hSqvJdO
   zh7uL5MEblGGPUG7YXa0eYAO7xRNN1p+1aqS2hdGQGoG6txGUY4yEpywJ
   seVz8XC8Bh2B6IM8+A/e0k6+9j6yMNwF9VxXl3dq7lPWPfvFR1BU3rTKp
   U36EUOfWRuA7oaMS3PEchV1Ua+z4xxLmVQIPKp73sIxcEqFb/2salAzAm
   LI+HBDjEYFLWbcBfx3kjVfpiGMKkv7ltlGUdAkvo0ytXVieUfjPGTjSZI
   J/SAVwMpS/mHhtiINvTmNCN3XyMkg9dNboKIzeFmp/Y1nKu7kFah132GP
   Q==;
X-CSE-ConnectionGUID: phhvGrkNQcmQCevkAihurg==
X-CSE-MsgGUID: 8JsEH8pkT16+XGgobNjHwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105253868"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="105253868"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 19:25:52 -0700
X-CSE-ConnectionGUID: ljuyh5m8T6q2jlKKefERtw==
X-CSE-MsgGUID: lzc3uwtQSNKH+PTRs0I0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="295704281"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 19:25:51 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Hillf Danton <hdanton@sina.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/3] net/sched: taprio: catch up in bounded time when the schedule falls behind
Date: Thu, 20 Aug 2026 10:25:36 +0800
Message-ID: <20260820022539.276469-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819075015.1259-1-hdanton@sina.com>
References: <20260818071706.251035-2-junjie.cao@intel.com> <20260819075015.1259-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 19 Aug 2026 15:50:14 +0800 Hillf Danton wrote:
> If now is computed based on the timer instead, now = timer->base->get_time(),
> which one do you pick up lad/dude?

Thanks for pointing it out. The timer's - hrtimer_cb_get_time(timer), since
base->get_time went away in 009eb5da29a9. Same value today, but taken from
the clock the expiry is compared against. Changed in v2.

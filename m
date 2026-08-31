Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E0346FA0;
	Mon, 31 Aug 2026 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161477; cv=none; b=DvT5QGnG3ssj3bnXnnUcrQIurtqXkISg6td/FJiGntOvkyD4v3hBI42IZkk9KdMPfzie+LGch6LLvbZK6BXE4QBdTzB6GytUEpbjzzJ9c+9zxWNrHXQyxwEtiDo1cmdnx+rAyiw1JzDncWgFzrUC72OCAxl/oB3bI9dM9xDUg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161477; c=relaxed/simple;
	bh=oSGldboH1uvgXu2MbGGoadDK9rZbswDa8PMTbbdDTdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8rsKLDbwaSeJjG/SM3/dfONkfN/WQaqOBs/kYB/wMTLodThFop9LudU3BMo+3u5ruWns22dQROAmXRpSeXywlMQm2ld6C8n66qLFsO7S7VbTKDRkW/3rBm4rMhQshLv0yjjTh+5LS+2oYj1TKWsMFuNNFpP/uBvQ1TG+8+Gt/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0EKYjun; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0EKYjun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788161476; x=1819697476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oSGldboH1uvgXu2MbGGoadDK9rZbswDa8PMTbbdDTdo=;
  b=l0EKYjun/SeByKCHcqC+fkmGsLx0PAxFZTu82aYAcmSBCpxuEZH7PP++
   XLhFVV7Pl4RBWbt/g2q1qR6wOROI/isNTdppiLDNfhHpjHB/ouitpsxlU
   ffq5fGYessNIX7Rr2UUxwPi1yBTGqMnOVsnfnQmcD+Gl+yFQIOdLYZoEo
   t06Hkp/UB3koCFfJAtq2ZdlBYVwhR7bb4FPkJi2crVexEX74sMMnCqMWU
   ImFUJYaXNTijSN3lCKksWhHy7j9LbjK1jMvSeMJy41JooBYgCFr2n1Saj
   I4r5gnVFW0D4ZTZgzCqYJPLv6JiqA/NlaKO8NqSGYZoDeyD9EpNXjnPBM
   w==;
X-CSE-ConnectionGUID: iLI6mEpnToGbDXjNprWTPQ==
X-CSE-MsgGUID: UqF6eO0aSmqh7pQV/tddlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99160740"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99160740"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:31:15 -0700
X-CSE-ConnectionGUID: f1K6lLKdRL2S8huG7AQaMA==
X-CSE-MsgGUID: Zy40uIQsTZugInKL+XgcyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268162992"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:31:11 -0700
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
Subject: Re: [PATCH net v2 3/3] selftests/tc-testing: taprio: add case for the software minimum interval
Date: Mon, 31 Aug 2026 15:31:06 +0800
Message-ID: <20260831073106.409864-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824185339.2704038-1-kuba@kernel.org>
References: <20260824185339.2704038-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 24 Aug 2026 11:53:38 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> A mirror case using "flags 0x1" with the same 50000 ns entries and
> expExitCode 0 would cover the exemption.  On netdevsim this looks feasible:

Dropped with 2/3.

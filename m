Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1540E8FA
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791358847; cv=none; b=jrOfPZWQFBWVn3KiSNqTQPFV0aF9B8ruRWWEvjs9wbcI5ARskYUCNliatmuTt0XqVBWZvyJ4Q97SxI6swwxzghPfzWOj92K6i6ZNntWODetVVx5Mlxul2G1TxpTsg5IehAIOhgj/kfX7OKdhr1rNGtUg/AKMNskOM9zPyldAa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791358847; c=relaxed/simple;
	bh=zpeDri79jDSPiCNzLVYdDR1QwvFynzb8SDt007S+BUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d/Ir4tAExOVSwChAsynr+l0rrtzn6vUBd5kutQ+pxTyIkZAqtm8uymccIuD4lKgnhof1doTnnpRD560PiWMyN6O0xH233+q4FIT7jb9rll/6VhPKDrMUlq6NsfOIitgZgvR22/th2ejnRZuAySbmNv7YycaZBLtNI9tqIxjIaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=reipbwgO; arc=none smtp.client-ip=95.215.58.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="reipbwgO"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zpeDri79jDSPiCNzLVYdDR1QwvFynzb8SDt007S+BUU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791358843; v=1; x=1791963643;
 b=reipbwgOHw61bicdazq6tfydp1bk2QE5irKFdom3PcMsljBchTbLBHL1iWxjSFMQgn7eTeun
 h0yFjuprTZ94Habw9KzOK0G9kAE7Up651btGe1z/N9J7+rAbjkTIR3HzyXSPtcUkQjLzsXkcqao
 yJn8JHsUDNoHThWaV77VkM50=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2885e374f357218a;
	Wed, 07 Oct 2026 07:40:43 +0000
X-Mizu-Trace-ID: 2885e374f357218a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	James Houghton <jthoughton@google.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
Date: Wed,  7 Oct 2026 08:40:37 +0100
Message-Id: <20261007074037.316564-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260922071945.693714-1-fuad.tabba@linux.dev>
References: <20260922071945.693714-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sean, Paolo,

Gentle ping on this series.

Cheers,
/fuad

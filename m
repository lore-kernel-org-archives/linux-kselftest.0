Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF123AB88;
	Sat,  1 Aug 2026 00:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544200; cv=pass; b=fr+Ps8dg1RMs8TSXznBb7HosH3kRlJc4Wlhu2ib4SnCCNDf+Y3ur20wXJmtgfNlVGYFuGbGCW58+JXw/OW1ZenfouhIkXTX8djIgSsE61Mpcf+wSIkGJ2prm1P72BhwzHRQWh+d70LdTUFsF/RZoXJz7W0NAY471bQu1o6zV9Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544200; c=relaxed/simple;
	bh=Oo8ktB1oIe7A3k/8FnlnZF8SdGqYtXFE5XWDIaf8EF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4WHY6p9LXN8kB9mYa0D2kSqjYOH0Lh3/aiMAqryq4XDu6ySOEkIwFA8zBZPoJ1qVnuLNt9Hn4zeMezVKCfICl/KzcENY+AyrZr5Nt5lRFRwBZsTONHfsYRNgxfyEh0krrj7rDYNMUECwCwiEebNitEoPZj64HWnslfhc6yR694=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=kFWu6rVi; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="kFWu6rVi"
ARC-Seal: i=1; a=rsa-sha256; t=1785544174; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=i01wJRsiQeC5gayqpJEVCG6YibCHI5mRTHR0hkoWCRPLtfEKZjnmmqpfrA6Y4R0jcl4ZymnXXWzYDhinEmEBQuzW4+0FVEJjkKIGpRwOO5IwYrmQZ31Un2Mw7nvZmetbsx7sqDH3dTBZkhYqlc2vP0ecuc4SDrIHHELL7vRCwIo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785544174; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Oo8ktB1oIe7A3k/8FnlnZF8SdGqYtXFE5XWDIaf8EF0=; 
	b=JHT44KS66TCVKXm3rWq6dKcrbPf3PNtQkc0MKUiUQEuYU22D/6C05Qfs6q7SHr4G72mEsux2BkCe1nwGyceVZJOa8c34BUxG/qslt7Z1XQqRMmR5CgLtaCiFR3QVAI4Eo31KC4lLLBEhZ+A/+DVeu6AikG49SHu7pubw/u1YvLY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785544174;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Oo8ktB1oIe7A3k/8FnlnZF8SdGqYtXFE5XWDIaf8EF0=;
	b=kFWu6rViw+xps7vC8Dt9W+1EfoTo3fLz0FLv70Gy5HnJ4Df15JlzZqYx4a51sQg+
	HlRkp3PxAcKAkPHhvmcb/gyg+KoJE3fVt7vR+oRRcaqcBW3S/qZfUus9htej2oUyXHe
	cg88B/YvlL44Zbm84mSoRY5IovUh3MiJuMyMGrt0=
Received: by mx.zoho.eu with SMTPS id 1785544171281710.4026826509987;
	Sat, 1 Aug 2026 02:29:31 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: xiexinet@gmail.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/3] net: hsr: fix shared-skb mutations in the forwarding path
Date: Sat,  1 Aug 2026 03:29:19 +0300
Message-ID: <20260801002919.241208-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728143604.26-1-xiexinet@gmail.com>
References: <20260728143604.26-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I reproduced both classes and tested the series under virtme-ng (QEMU/KVM).

Running hsr_shared_mutation.sh on an unpatched kernel fails both cases: in
the PRP LAN-ID case all 200 frames leave slave A carrying slave B's LAN id,
and in the HSR RedBox case the master receives the RedBox MAC instead of the
originating node's MAC. With the series applied both are isolated: slave A
keeps its own LAN id on all 200 frames, and the master keeps the node MAC
while the interlink keeps the RedBox MAC. The test passes.

Reviewed-by for the individual patches sent separately.

Tested-by: Ali Ahmet Memis <ali@iusegentoo.com>

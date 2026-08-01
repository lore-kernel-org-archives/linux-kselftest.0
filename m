Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B78330B01;
	Sat,  1 Aug 2026 00:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544202; cv=pass; b=DRBfHPTbFZh5+N2wcYNSpHtNLt8b/P43aeOoULhVR9nZoofDuMVjAszkW79BsWjJHXghuiw9LNIfuksslYgfkC4kqLdzkzOFS4GyQ37ugf/g9isQM3gYCMi4Ph7lbqD6efrm2lpiyJ8vOFycdq0/I7pWQ5x5bS/eh+yB+g+zX0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544202; c=relaxed/simple;
	bh=YRUWZ9DNGa0m7Ubjh4sd2r8kwcNGiN4CDequP1LnvtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ci8+MRNwUpHfkV+FTDg0bUmJrxRx4iawmA63VfOUouoxGxRzqt9oOPiEyQhcbhZ0ToerfB3s9Umhb+6RJr6tkuL7FBboTwZO8+zAj52tSA/WfhXSiGxbGemZlinotcic8Bs8KAjAcaUCJWyW7mF+hBwM+sKhD5Ty6pqin22LWRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=dxKp9Opo; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="dxKp9Opo"
ARC-Seal: i=1; a=rsa-sha256; t=1785544185; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=bpUZ7Qf/3ABIDN4cOcsQQBwbEbVfTBTnO4ecdKCgFj0iQ0O7t2yyfWOeNNEDUuKNTTEDyWOvbGDvnL55Tk6WnwD6Z91Mzyo8oKKWEMvcMXUG1XhiukErRQS2FWQEF1dfFdq1kM9HacBBLnTBz5LXYSZN5PtVYOsf3UcRFD6a6FM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785544185; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YRUWZ9DNGa0m7Ubjh4sd2r8kwcNGiN4CDequP1LnvtM=; 
	b=DMKIXPkzqLsndpzXt4lEfsMC19t1Ky0noTCtSQs2xb0pI2gtJJPV6tPDGoHQzvN/XY+gumfiZrXIEBVdBiTwKa+jxZCRLAWm70woG3eh2CgcjRuzL/bxBxsxyotTJgKSLQ9cc81GcBmvKL1WXdpANKB4Aqn/21O/w/d37Aj0bKE=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785544185;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YRUWZ9DNGa0m7Ubjh4sd2r8kwcNGiN4CDequP1LnvtM=;
	b=dxKp9OpoU7sbxounxPp8yjaH5ZkD2p6vvoK3VUaKBGX5+geC7Kue87e4RwHkcPZc
	uosRRWWN8SHk19cWnRcGBU1useXrk6239USuJqZdd3UHlpHIcw/OBX1o9xwwnupT90l
	U/fNbcPPRIQGai8MFTuCTAc5IIv1Kj9Vg063Pcto=
Received: by mx.zoho.eu with SMTPS id 178554418405749.5205180207995;
	Sat, 1 Aug 2026 02:29:44 +0200 (CEST)
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
Subject: Re: [PATCH net 1/3] net: hsr: privatize interlink-bound skbs before address mutation
Date: Sat,  1 Aug 2026 03:29:31 +0300
Message-ID: <20260801002931.241238-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728143604.26-2-xiexinet@gmail.com>
References: <20260728143604.26-2-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The skb_cow() is placed before the address mutation and, thanks to the
short-circuit, only runs when the interlink skb can alias a live
consumer: master-originated frames, or ring frames the master also
consumes (is_local_dest and not is_local_exclusive). The zero-copy ring
paths keep their behavior. On allocation failure the frame is dropped
with rx_dropped accounting, matching the tagged-frame creation failure
path. Reads correctly to me.

Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>

Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7423546E2;
	Fri, 31 Jul 2026 23:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542315; cv=pass; b=Pj/CyqyexIpLFLXqUHiaRqYaGc9uLIGCeoMl9tGBD5n3loDWwgO7FydowVhJA/MyfzH/I4++YNkUR9z55StueWgV2awPgswAmCUZZnhlION+UfvCTNqQVDiWk8nUpyHjCV2734097Js2jEvpOMYo34jKJHukS2TBl0dlLq8xCak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542315; c=relaxed/simple;
	bh=l1vrpNqgWN83YNMcggHN1LJ1I8uOJOLaMBeiiGtetSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S20IiUD+eDFBdgLpepDo30a0IvQJ0aFEYIE+qjUwEH5l/DKqTKg7iJF6VLcjKf8AFMuiWaZiwAcB0NYMbb83ucohzpNxayjmgYo7TUqPDfiUwq83Va3UnzSKo3iMlN2sn6CEEYEBwgubsnwDUtpiP97KCNasdScr2u/Xpm6IOlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=AzMdvKwz; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="AzMdvKwz"
ARC-Seal: i=1; a=rsa-sha256; t=1785542297; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=WX5XyM4fTvhxDNXXaVuVrjfgqmlns1mzH9lGwyU3a3dd2NX9hsRdyYhWeEZUuNqopePLvu+TgBxA3uDvOIomHCZNQA2KsdNjvU+M27uPsQBnBq4S+q7llHsB9o5QMf8tOyfJt7nphPEiZ5eWI8kl1f1njn5wuZ8G79kkHMmgSB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785542297; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l1vrpNqgWN83YNMcggHN1LJ1I8uOJOLaMBeiiGtetSQ=; 
	b=e6AESJiNslyuLLgWlE398Gc7Box+MaDrJ+m2o8Wbtu43BGqefj2ePJldjdFAyWuLRaejujVlOaMTP1ru98GF4obRsXeuRe3dtpaHf3kUtZAf7HluUpscs40y0WB5LBymCQrO/EcE1i/vE9gpxR06c0vas33nHRrR+W16y48XqGs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785542297;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=l1vrpNqgWN83YNMcggHN1LJ1I8uOJOLaMBeiiGtetSQ=;
	b=AzMdvKwzZoyhPfldWQo9Jn/ceYgS9yJI62Uux/muh8FMK4y/p8h6u6PeIxM8O7N9
	Qxwz4l4pWJJrMwfxrUCKhhb4IWXYnH3+BDwzYTXjjaxXiPD3t3MUVXvO0R0xZ533qQu
	C7P6JIZZ+YUzkuGedriPyBv6kVyeAu+MqJn2/qNc=
Received: by mx.zoho.eu with SMTPS id 1785542295141313.1768707530664;
	Sat, 1 Aug 2026 01:58:15 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: xiexinet@gmail.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH net v3 0/4] net: hsr: fix GRO/GSO super-packet handling
Date: Sat,  1 Aug 2026 02:57:27 +0300
Message-ID: <20260731235727.204167-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731090224.18-1-xiexinet@gmail.com>
References: <20260731090224.18-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Fri, Jul 31, 2026 at 11:02:19AM +0200, Xin Xie wrote:
> [PATCH net v3 0/4] net: hsr: fix GRO/GSO super-packet handling

I tested the series on top of net under virtme-ng (QEMU/KVM, x86_64).

selftests/net/hsr/hsr_gro_superpacket.sh passes: the SAN emits TSO
super-packets (TX frame-size average around 41 kB, well over the 2048
byte threshold) while both DUT LAN legs stay per-frame (average around
1497 bytes, under the 1514 byte guard), and the test reports success.
For contrast, without the series the same topology leaks oversized,
HSR-tagged frames onto the LAN legs (up to roughly 28 kB, ethertype
0x88fb), which this work eliminates. hsr_ping, prp_ping and hsr_redbox
still pass.

I also went through the code. Patch 1 mirrors netif_disable_lro() and
dev_disable_lro() faithfully, and clearing both NETIF_F_GRO and
NETIF_F_GRO_HW matches the changelog intent. For patch 2 I audited all
seqnr_lock users; after the change it guards only the sequence counter
updates, so dropping the outer lock around hsr_forward_skb() cannot race
any other state. For patch 3 the __skb_gso_segment() dispatch and the
consume_skb() and kfree_skb() paths look correct, and the port type gate
keeps LAN and tagged aggregates out of software segmentation.

Per-patch Reviewed-by for patches 1 to 3 sent separately.

Tested-by: Ali Ahmet Memis <ali@iusegentoo.com>

Received: from sender-of-o59.zoho.eu (sender-of-o59.zoho.eu [136.143.169.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53983B3888;
	Mon,  3 Aug 2026 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791278; cv=pass; b=qRpoDK2tahqdaQz4WnLSV3eCZaBYEr8yWy9itWNwmWU3kwItelxmR766CYLWWclpWQHqZbMa7JTqp55p8MhdiAKpu4rrq3cjfhWREBSaumEiqTNee1W3NoVUHxVo/yMsiayGry3YxervJP3oIlD2k83ouY4Gmg1ZN25I9z6KNIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791278; c=relaxed/simple;
	bh=AxkWzGW3Qi3bk4Vv3PFysuGtJqfZ5f3EgOZpIL0TTSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeEe2/SvAmUZB1RRxT358X7ty8yDOHUUBIQKu3XGAFh/kaMapkmHKEDAfzvXOw9/mZQe98iFfbhC80GwoxFdupCnAEtp6vLrnPuyRnY+9rzCRz7zYKiAaWLJZ/Y2iscrvn86Btzrx+YBwmSA7afl7NXaiwiC5U5BrMtvJRHFzHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=dIscssv0; arc=pass smtp.client-ip=136.143.169.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="dIscssv0"
ARC-Seal: i=1; a=rsa-sha256; t=1785791252; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=M0B0a+/jPJf2Grf4znhZUx+JnrNn5Jwp3oRMaa3b+179O+qhSCcD7GGsB+9TgEdt8fRzTZocmpdMTh3NYZwFBYgpbPUBkIIVWxK07mfA9Lj4O6E0NHbGF9zaeAC/gHOh9GFX41qeWXWU4ccHH1kI8cGOn/fJqEk8McHJYRd7tDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785791252; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VwBlIHBKfXlDFS7S3c02nz0U+3hDwxWqpf4Q4qmWM6I=; 
	b=EABPEMiJ0OzH2R/wPJGu0Wbj40ogtZb0RusQ90z6IZaA0LPi9fMpliHiwttqpgnvj5bl+gV+Nl+ZvjoM3fPAwFt4EtafWB93FDhochrBWCPZZS31/HkUWfjMxJeJNgt0NVxDGQi8EbXJF35oncFvdgztYsYCsIwlDLH6OCQwn38=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785791252;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VwBlIHBKfXlDFS7S3c02nz0U+3hDwxWqpf4Q4qmWM6I=;
	b=dIscssv0HYFGyl9CumEW8/5UFD55UAfWN6aYhLwGUg7FJDDXWrmz9/JIb2BHe2SB
	rObpmmd7uNSiTpwaJnoTzhVo6NVyXxHNYjR5bpnyy4tYzfIX3YF1FFgc0KS2aUdNBCp
	xLwLL8bGcrFyG6vvj/z8v5mjIP8yobnsELJcu12A=
Received: by mx.zoho.eu with SMTPS id 178579125042968.12080696502551;
	Mon, 3 Aug 2026 23:07:30 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: xiexinet@gmail.com,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/3] net: hsr: privatize interlink-bound skbs before address mutation
Date: Mon,  3 Aug 2026 21:05:41 +0000
Message-ID: <20260803210717.123417-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803124305.09e0da44@kernel.org>
References: <20260728143604.26-2-xiexinet@gmail.com> <20260801002931.241238-1-ali@iusegentoo.com> <20260803124305.09e0da44@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Mon, 3 Aug 2026 12:43:05 -0700 Jakub Kicinski wrote:
> How are you producing this review?
> I've never seen this sort of blurb human-written.

I write them myself. English is not my first language, so I draft a comment
and then keep cutting and rearranging it until it says exactly what I mean.
What comes out is denser than how people normally write on a list, and I can
see how that reads as machine output.

The content is what I went through in hsr_forward.c. hsr_deliver_master()
calls hsr_addr_subst_source(), which writes into the header, so the copy has
to happen before that call rather than after it. It only matters when the
master can be looking at the same skb as another consumer, and in
hsr_forward_do() that is decided by these two:

	if (port->type == HSR_PT_MASTER && !frame->is_local_dest)
		continue;
	if (port->type != HSR_PT_MASTER && frame->is_local_exclusive)
		continue;

so a ring frame reaches the master and a slave port together only when
is_local_dest is set and is_local_exclusive is not. That is the case I meant
by the skb aliasing a live consumer. The accounting remark was about the
create_tagged_frame() failure just below, which does
frame->port_rcv->dev->stats.rx_dropped++, and the new failure path does the
same.

If the phrasing is what bothers you I can write these plainly from now on.
I only tag patches I have read through myself.

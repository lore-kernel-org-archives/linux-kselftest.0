Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E03380FF7;
	Thu, 28 May 2026 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957738; cv=none; b=V+JdKHNyaEIfU4LYme1bi+uqAbSKYDm2QG74/u/myApLqtVtWXw5M2jn9hUGD/cZpHuWZkA4QO/lOyekC9b+sXX+MaVNo6EvVF43FAxf24j66RR9FxRcEdCFlgkugiB14b/bZO14nHkRUc8ihMhLzM2PI38He8PoY6qtTiY/+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957738; c=relaxed/simple;
	bh=xIgos72Cm3IfTWMmCN5oml+JjbfxfQGDyXLbhC97Awo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHkm2Vo7ghB2+Qc7OYQdh7hs79H0Wn8OVn5seKn63cAYNEDGXxeMdLGcj/71fSP/Z9xnlrO4mcFr7zbEYbp7Et+SN7ly0gUV9YV8NofcyZ9qVP9ALc1RtcKMyUWddLvurb8DlRThCcoG2lr7zz8bnla9BjOcdAGHnBMMv7FxxL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1FAB968BEB; Thu, 28 May 2026 10:42:11 +0200 (CEST)
Date: Thu, 28 May 2026 10:42:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geliang Tang <geliang@kernel.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Geliang Tang <tanggeliang@kylinos.cn>,
	linux-nvme@lists.infradead.org, netdev@vger.kernel.org,
	mptcp@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>,
	Randy Jennings <randyj@purestorage.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	zhenwei pi <zhenwei.pi@linux.dev>, Hui Zhu <zhuhui@kylinos.cn>,
	Gang Yan <yangang@kylinos.cn>
Subject: Re: [PATCH 00/11] NVMe over MPTCP
Message-ID: <20260528084210.GA8141@lst.de>
References: <cover.1779934709.git.tanggeliang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779934709.git.tanggeliang@kylinos.cn>
User-Agent: Mutt/1.5.17 (2007-11-01)

You need to talk to the NVMe technical working group, not us.


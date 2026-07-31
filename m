Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229646984E;
	Fri, 31 Jul 2026 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542349; cv=pass; b=UvM4D9yIgOldGnueBX29FYv+A4HsC3AzHVGdX97vrjEuSSZwCAuyFq5lq9SEi+Nay3opjxTF3fu2FKZSPu5wWrf4COved8Uwq1KledpfueahceN8DvRRm4VwYKvyqg6WZkOOpupZtTKUHws7iuTkI9uyLUSLbU4vBjcK1oiikLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542349; c=relaxed/simple;
	bh=78Z9/psWoLjcExw8ynbakmfyXxvTvvimokEnp+hQ5xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyA8aIPE/OFgJL2OVR5Zvd5PLozCFoj+eEvXUaYpEHzZ03tcmdtf4OgcT+nzcX8q8VjCwc2qrFOC4AfIRWud/c5czZ2DKmIyCsTzeVEyN0CkkUKua3oH3aEC0LbXQlwmE07Y0BR9YHILFHOKmx5OqLWldR/SqdgXqqmsEnRaqvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=LUwOblYy; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="LUwOblYy"
ARC-Seal: i=1; a=rsa-sha256; t=1785542334; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=TJW/q085tPIqVMV2d8e+JB6NTEqUZVEF13rx2lVSl7gGgP/Qm40sHu3aE24lTnEPyzaq2aewy1D6VyF8ujb29E8k7B18He6I4XjfVCArx0ORRZJEdOkpMpeTtHEB3WQWRPXS48px6889kLlNjBmfMIfRaH1VEilb9HMeMxDE5ro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785542334; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=78Z9/psWoLjcExw8ynbakmfyXxvTvvimokEnp+hQ5xg=; 
	b=CY9r9ZMfhgyoVei8HQEGKTJYAm+6MU5urhwChUj1g8hNzoSx0EDC0HW2RDRHD0JRPSzWRbctBLDggLSUeHxZ7+cIDudh/rxTEQEeAJ8m6XVmmc/A29pB5R4MNOA29F3KGdHq9tdj5qy2iV3FUBoO4CIoUAI9LdOGR2JXgIhzwmc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785542334;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=78Z9/psWoLjcExw8ynbakmfyXxvTvvimokEnp+hQ5xg=;
	b=LUwOblYynq5zCwGFXDDzKe529RWpI6sDJBNz7pZyJQR0/71POYvw20bvHgKU6zWv
	o6/Y4SBkA/mxK5BtgIgFN+4opDc+9srvJbi65LgVBD7fk+DL6tcqA00cwkV8KgB+2Wv
	TH4V6umhb2F61mAoXOuhNj7ZMhlAghr+USlnEGkc=
Received: by mx.zoho.eu with SMTPS id 1785542331965706.575348429055;
	Sat, 1 Aug 2026 01:58:51 +0200 (CEST)
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
Subject: Re: [PATCH net v3 2/4] net: hsr: shrink seqnr_lock to sequence counter updates
Date: Sat,  1 Aug 2026 02:58:37 +0300
Message-ID: <20260731235837.204367-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731090224.18-3-xiexinet@gmail.com>
References: <20260731090224.18-3-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I audited all seqnr_lock users after the change: it now guards only the
sequence counter updates (handle_std_frame() and the two supervision
builders), so dropping the outer lock around hsr_forward_skb() cannot
race any other state. Lock and unlock stay balanced on every path.

Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>

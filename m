Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9E419D092;
	Sat,  9 May 2026 01:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289258; cv=none; b=CW3Nm7MJWJLBEAD5LCV8vVcn64p2y9od+QU4q6AktMoBxZ1KWAPquCove0ZEr1j/WHhZ4aNL3u6iSJlRXyzgYlWtEZKJEA8VdV7x7fNdwbemK5frixETWkPNlUvv/ZsZwzfHCLOo8Ou5PL29H2+NeuXy5dHX3zDrlbd0u61Wtn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289258; c=relaxed/simple;
	bh=XRHNcLq5Tj1i0M+Gmb8T2rSQFwfwqj9JUey+Y69ED9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxquXersO269kiemtQTl1sR1s+FDvo/GDW83e/ninH72mOK0RyzcOSQ9qt3S30ADpiPszHkWkZ+8tKYz1uUaomfqNSVVY0F+RtElXSC2l/rClvQgqZZq0KDPh/Sy4AZGuvVVS8IFLirfmkMBsRit0e7jgJckjoEUoFzGen75xog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ivtK7cwN; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ivtK7cwN"
Message-ID: <a8036fda-3509-437e-b787-4376992a0359@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778289253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQf4QhBnU6nphvM2y/gxe0oUuO7UtOdH2zT46D3ROV0=;
	b=ivtK7cwN6Gmt/Rw7yU22E5yzq1ad9CHhMzTs9ST6/KJ+AyoI3d1FJLGxfw4cuVZjdYR7n+
	OsydfGIebDbj8s7wUYItWwxR1yxLAfOL09hQ6qUkEdErLagCIXmHMfrGBZNpuu0BfORitG
	/8H4UINJ+seuBn13D7GknZKgIuovGZ4=
Date: Sat, 9 May 2026 09:13:58 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] selftests: net: add tests for PPPoL2TP
To: Felix Maurer <fmaurer@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Petr Machata <petrm@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260508032158.67887-1-qingfang.deng@linux.dev>
 <af4czAjnz--nOUYf@thinkpad>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <af4czAjnz--nOUYf@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/5/9 1:26, Felix Maurer wrote:
> Is there a particular reason to create the test setup with a netkit pair
> instead of the more standard veth pairs?


L2TP does not need an outer ethernet header so I choose netkit instead 
of veth.


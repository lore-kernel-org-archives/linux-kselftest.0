Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B990B276050;
	Mon, 21 Sep 2026 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984541; cv=none; b=eT9Dsckk9NsmUQeduBmXhK0lbjnRcE+8xiys5M0mh5Uh+iiFxWbhMW9r0ZyiakUaEXU8JrP/5HZfYIsGacU9DUdU/UQ+H8r0hDhpL2zOkwMKUIL8atocSYA/c3EDlcC1ooS+mCGHXY6WWeOdYhUgZgeBQrMu8mfzOZvgmcLMBf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984541; c=relaxed/simple;
	bh=HtktVx/5wu8n4HrwStgefIj+KDjkCZNU89AbZotB19E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBNpQcKeSukU/37QWt9uOzPlcATOqg9FnWOxpBXNvOAAakC8omwX0bJAkg1JCE1FzfNfbzPkdfIQV4+isGZojAIZOPnNUXgQIespWWfo497OZ2ofxdMPqZu5ELd05p0rGKt4mdoC7wr1rax8pJYFc2kiokg8KoSCZ+pBjHjduas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id DD4D340C36;
	Mon, 21 Sep 2026 11:55:29 +0200 (CEST)
Date: Mon, 21 Sep 2026 11:55:27 +0200
From: Gabriel Goller <g.goller@proxmox.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] selftests: seg6: check extack messages on
 SRv6 lwtunnel setup
Message-ID: <arD-5t6LiBiPXAAa@luna.proxmox.com>
References: <20260918153544.1178884-1-g.goller@proxmox.com>
 <20260918153544.1178884-3-g.goller@proxmox.com>
 <20260918150256.1a1ca82e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918150256.1a1ca82e@kernel.org>
User-Agent: NeoMutt/20260504
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1789984528102

On 18.09.2026 15:02, Jakub Kicinski wrote:
> On Fri, 18 Sep 2026 17:35:16 +0200 Gabriel Goller wrote:
> > Add a ksft/ynl test that shoves invalid RTA_ENCAP payloads to
> > RTM_NEWROUTE and asserts both the errno and the extack message are
> > correct.
> 
> Please be judicious when adding tests.

Got it. We can either drop the whole second patch or I can simplify it and only
add test cases for a few error messages.


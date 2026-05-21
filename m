Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964A3446A7;
	Thu, 21 May 2026 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377011; cv=none; b=IC4m0KVPNZFupRBYToIGUhDBRzBE9SsC00WnqzB2Bu3hSK7YKaoJWNNbvtx+E0YwBPLAowO2pGsS69yC4nJQYBbgHYgPtU3GXNU3MoUvBdLw7jMnGeOdHrMok38hkWaudNiP6HVK7aqOovJBjfLKr5tcXr+FzTOQJ2Cy9igqXVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377011; c=relaxed/simple;
	bh=DveREk3xTvkXtuq6xr+G61/Gx442dXVYQMXGJiIIV4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCT1XUR+60COvytkxXGxrmRSaMdoSZadAfoNeqaxE5VF4weBpvNwGEvUQiDcH+Fx8xd1FBmvYiQrcB1Um5da27hq7WkTtAfbCfwm+fXzi7Ia8x9NVgYiahYmMe5EDowVvPUFvSswXRgbngeoOFxIS0NSffOTUje14lTGmcOhGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdSCRWHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdSCRWHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4081F000E9;
	Thu, 21 May 2026 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377009;
	bh=GK+Jeez82vfjWCBn2IWK248118X2pv5iFWU0+rDUYpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bdSCRWHjfhRB10FzSvKMuYXmpI4CxK7/fR9po2m3k/NZHAXjjeIJnQ+iSetMF+0YD
	 SBhcVverpe25b/jbh8w+qj1GJXxHhGBUKJKXVavCZWPCrrt6vI6JVzbnJaXQlADfka
	 txNRJoHCqDExXPmPHpBoNMRj/WBNWkfUpZ0JAlYDtpzduUhO6JbP0f5GCTo0uOMma6
	 6eSCKaXZZeEs7REcW6VNrnsPD2cwdXIqtp9KtHjNBiXi+9ag55CvBITMLu3R8aI7SG
	 NIjukWdc/O30E2G7HrKPqcj35LkXtYGn6Bi0UDT7BhKnp9TZTvcIBMmauYTSseDMSU
	 0Kz+/ggjffPFw==
Date: Thu, 21 May 2026 08:23:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Shuah
 Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook
 <kees@kernel.org>, Adrian Moreno <amorenoz@redhat.com>, Jiri Benc
 <jbenc@redhat.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matteo Perin
 <matteo.perin@canonical.com>
Subject: Re: [PATCH net v2 0/4] netlink: fixes for cross-namespace nsid
 reporting
Message-ID: <20260521082328.21ac0dbe@kernel.org>
In-Reply-To: <20260520172317.175168-1-i.maximets@ovn.org>
References: <20260520172317.175168-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 May 2026 19:22:34 +0200 Ilya Maximets wrote:
> Ilya Maximets (4):
>   net: netlink: fix sending unassigned nsid after assigned one
>   net: netlink: don't set nsid on local notifications
>   tools: ynl: support listening on all nsids
>   selftests: net: add a test case for nsid in all nsid notifications

Doesn't look like this will make it to today's PR but let me apply
just the ynl change right away, the same code is changed in net-next.
Let me save myself the merge conflict..

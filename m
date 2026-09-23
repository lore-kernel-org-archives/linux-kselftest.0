Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C56A2BF3F3;
	Wed, 23 Sep 2026 00:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122751; cv=none; b=YyfHy8cMMZplCtuwZ212auP/YdnXIHyy1F9UTBu16e1BrcpgXYft2MNuyzZ1n5zMq2pioC+moRHX2yJVEzSBHdjgVLE1HP23zeuXjf2G++C6FcBzpOlSQfsiY3UfZzJuvwIatDN9hqv700TdvqHUz4a7SNceCO0uPIIO9Ne3LYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122751; c=relaxed/simple;
	bh=4F82WtC3ESk9GNvbwn9yrXo7+LHMGQh2ZyCKvRTYwqU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hJZNF3h76AmLkrPDRZoo4Qp8BwACrwH/D9L98+f7xyKgcTaHuWnzLP/G1B0QanouOAQupBJBT96R+uC//G7TUwK8zPDrLJgSRTES/gDXI93hBNfIHkGElxc1UScY37sYbrHY0obTNC98V5/ZgniechoPjOwcxBK3m4R7fPWU+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWKJSp0X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWKJSp0X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39381F000FF;
	Wed, 23 Sep 2026 00:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790122750;
	bh=eqdMjqYl8vE+g52bw2hywgBAq03n4GyavNOTFhH8d6U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mWKJSp0XfadogGYO4ysC1DZW8DWtduke01hSyIVBr8GXQT9lCGjFm8AaL3+wifCqa
	 dVtDquFWq5Zu7exIEdgtx4UlR2wKQI/vV6L0vuQYenbey1HyXa5cioooZmTT7ILib3
	 uzlKLiOQWoViHYOzAwpzdZxZD0t1teJoBraGOT/5boBliwhKQF7tjAciSBRp7UgId9
	 mAcOnzOfrvfjq92mZ4+iiU6VKfOdNWNQOGTuQ3acfhB+VD6rH/aaZQCn6p21FKsXvY
	 /tHRWQGbEkzP6ohH1L6vokTVMp/kcVA2qAHn54e7UAWjCp0mmEm8bESeryNB02s8y6
	 XSDB/u0qvVmbw==
Subject: Re: [PATCH net-next v6 1/4] netlink: specs: rt-addr: fix the type of
 target-netnsid
From: netdev-bot+sashiko@kernel.org
To: sigefriedhyy@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com,
 nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com,
 sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Date: Wed, 23 Sep 2026 00:19:08 +0000
Message-ID: <179012274833.2160803.6278526272510624940@kernel.org>
In-Reply-To: <20260921235951.3214-2-sigefriedhyy@gmail.com>
References: <20260921235951.3214-2-sigefriedhyy@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch fixes a real, user-visible defect in a shipped netlink
  spec — `Documentation/netlink/specs/rt-addr.yaml` declared `addr-…

--

netlink: specs: rt-addr: fix the type of target-netnsid

This changes the target-netnsid attribute in the addr-attrs set of
rt-addr.yaml from binary to s32, matching what the kernel policy
declares. No Link: tags are present in the commit header.

> diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
> index 0ecbd24c890c6..17ead22034515 100644
> --- a/Documentation/netlink/specs/rt-addr.yaml
> +++ b/Documentation/netlink/specs/rt-addr.yaml
> @@ -119,7 +119,7 @@ attribute-sets:
>          type: u32
>        -
>          name: target-netnsid
> -        type: binary
> +        type: s32

[Severity: Low]
This isn't a bug in the change itself, but should this carry a Fixes: tag?

The spec has been shipped with the wrong type, and the generated ynl code and
the Python decoder have been treating the netns ID as an opaque byte blob,
with the request path rejecting an integer for a binary attribute.  The
kernel side has always declared it signed 32-bit:

net/ipv4/devinet.c:ifa_ipv4_policy:
	[IFA_TARGET_NETNSID]	= { .type = NLA_S32 },

with nla_put_s32() on the emit side and nla_get_s32() on the parse side in
net/ipv6/addrconf.c.

git blame on the pre-patch tree attributes the type: binary line in
Documentation/netlink/specs/rt-addr.yaml to:

  dfb0f7d9d97956 ("doc/netlink: Add spec for rt addr messages")

so would adding

  Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")

help backport tooling and users identify which releases carry the wrong
type?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921235951.3214-1-sigefriedhyy%40gmail.com

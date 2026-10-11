Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04D8223DE5;
	Sun, 11 Oct 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791714629; cv=none; b=rAAttjsZtRBU5ZtBErX77yFFoXh8LSPiFCvncqCbPAgTUfqGT+TTRsJW18z2A1ZzyaZ8pXFXelMg+abG8vGDvdOM7/WkmUxXRz8HCBzjDybU3PXMVNSt0uhz5bhi1PWXQfstgCGYcuyKu76EefpMHIBRLXDlLKQDK5AAZQq4xUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791714629; c=relaxed/simple;
	bh=VaVUIa6xV/Mgc5QCMYUmP1Ndx8oEMQyTc8zc9KgNkfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkM7Ga98Mzlu4yQH+8ZHAkCv6Np7mhZkjhJdfXjrw5Avaeo5LLR2zG+u1QZ1v7cwyFTKYWdVP6mp8UQGJrK/+0bGg0qwZwoBVs7PsIrUSFgiL9VhPl8Gqi+cqV0TTc8xkYBKuYXfovpYb/y7wA1FCqmFzbvtx6hiiL3MJ5UApNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=jK/CA/8x; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="jK/CA/8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jK/CA/8xg3M465P+mkUbZCrvspjKvGyerE9JuBg1cu+tloxTauuX6t+S+3byomWX8eBdWWp9mEaqM
	 rHzpFMJqBTn/IIRa57dVOWgf6pvGbnFzeLwfSaVmAVBb8h5XiYT2O9uoNvr9vcx92dtxT4qIHHc5c9
	 GuNghhy1eSFQZ+Q4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56acb653f213-cd15c;
	Sun, 11 Oct 2026 18:30:24 +0800 (CST)
X-RM-TRANSID:2ee56acb653f213-cd15c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03 (unknown[112.22.251.201])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76acb6537077-676d3;
	Sun, 11 Oct 2026 18:30:24 +0800 (CST)
X-RM-TRANSID:2ee76acb6537077-676d3
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	willemb@google.com,
	martin.varghese@nokia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: bareudp: Add stream tests with software GSO
Date: Sun, 11 Oct 2026 18:30:14 +0800
Message-ID: <20261011103014.1605368-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179168180510.434549.891701914488385708@kernel.org>
References: <179168180510.434549.891701914488385708@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 11, 2026 at 01:23:25 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> The new header comment says:
>
>   so that the GSO packets encapsulated by bareudp are segmented in software.
>
> Does that hold for the two Unicast MPLS stream tests?
[...]
> Should the MPLS stream tests be dropped? Alternatively, the header comment
> and commit message could be updated and CONFIG_NET_MPLS_GSO added to the
> selftests config.

Right. Counting calls with the function profiler, the MPLS streams only
go through mpls_gso_segment() and never reach skb_udp_tunnel_segment(),
while the IPv4 streams do. With mpls_gso blocked from loading, both
MPLS streams fail. (When it is a module, it does get loaded here, as a
softdep of mpls_iptunnel, but the tests do not reach the tunnel GSO
path anyway.)

I will drop the MPLS stream tests in v2.

> [Severity: Low]
> exit_cleanup() calls cleanup_all_ns before the new `[ -n
> "${TMPFILE}" ] && rm -f "${TMPFILE}"`.
[...]
> Would it help to remove TMPFILE before calling cleanup_all_ns, or to
> tolerate its failure?

Yes, v2 will remove it first.

pw-bot: cr



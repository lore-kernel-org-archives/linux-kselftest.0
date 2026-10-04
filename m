Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0859D442370;
	Sun,  4 Oct 2026 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791125368; cv=none; b=n4zUvZD3HnUwpQW4JCpVeBieMao9D1RNTQpU4bkbpKVW8SCeNHckrW+SNYixEiK376lBYkXT3HBX23LJ9JPE+0itcaCMPjV3P7GdEZrjYBWqVq4TiKBcBWA+VBT0LLEQVcF0gCeJ4SdZxJ3slfQ1x0rkVeylMqvgSGF89Ca8yqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791125368; c=relaxed/simple;
	bh=n/bsfr5Ie2mthGBcdNfgnOxf9AGJc1SSIC3qCiVBYQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eubk05FS6zZVgrL3uV1s/S89uIet+cZhh8+8OoZU2jhba82zX+YgSdN7m1UWEZQvAkhUKwarQIfGqOUIcbMeGd/Z67IKRBAQ4a27RjYRUzpOUG342+6Hw6lt8vemNsCEaM1YzruG8ovIbPsIvZm/fHtcuCBkKPOcVITmIu7D4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=zJxtxjUu; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="zJxtxjUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=zJxtxjUugpBDLUJveGh3LCMglc4eUIobNigrAfBGq3Qf5CFogai1x2qcuZvxRHkRyLXPdf2Zma91u
	 ldkNb4l15Whpx6TfG9RZnBHt8+aOOvxXH8bGZTHUa0GoYu10CCNgO3QmZVpPLyrLzyzUmXmg/ueho0
	 WbWDfz3Rd5M3xkeQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66ac26764d2e-6cb07;
	Sun, 04 Oct 2026 22:49:12 +0800 (CST)
X-RM-TRANSID:2ee66ac26764d2e-6cb07
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03 (unknown[112.22.250.209])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ac26756250-7f8be;
	Sun, 04 Oct 2026 22:49:12 +0800 (CST)
X-RM-TRANSID:2ee36ac26756250-7f8be
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] selftests: net: big_tcp_tunnels: Cover bareudp
Date: Sun,  4 Oct 2026 22:48:44 +0800
Message-ID: <20261004144844.831190-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179110869274.434549.7292617532752243045@kernel.org>
References: <179110869274.434549.7292617532752243045@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 04, 2026 at 10:11:32 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Can the bareudp cases that use IPv6, inner or outer, with csum offload off
> pass in this configuration?
[...]
> Could the bareudp inner_protocol handling be fixed first? That would mean
> setting it from the actual inner protocol, and also setting it on the IPv6
> path. Alternatively, the bareudp combinations could be limited to the
> cases that work.

Right, and this is the dependency mentioned in the cover letter. The fix
does exactly that and is posted to net, reviewed by Willem:

https://lore.kernel.org/netdev/20261002153039.462663-1-yanhaishuang@cmss.chinamobile.com/

With it, all the bareudp cases pass. I will repost once the fix has
reached net-next.

> [Severity: Low]
> Should failures from these commands be passed back to the caller?

Yes, setup_bareudp() will create the device itself and return an error
with a message if any step fails, and setup_tunnel() will pass it on.

> [Severity: Low]
> This isn't a bug, but the comment at the top of the file still reads:
>
> # Testing for IPv4 and IPv6 BIG TCP over VXLAN and GENEVE tunnels.
>
> Should it mention bareudp now?

Yes, I will update both comments.

pw-bot: cr



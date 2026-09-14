Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323542AD2E
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350355; cv=none; b=H9Z7KVjBPZNkeNhx4DDmEflM//9czjvggxVjs/MtoJ1Kxiw+8jNrBi8x3PnfW5Un0Ws6Ngw4DQkuzU3UvVkv0DZ+iWJNZkvCWrMfQSOkjQuCgXBUtx9A6XLT+flv+Inse/DPREU+0HmyIU9CXegG0hEeV36xE23GohSjF1l2GHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350355; c=relaxed/simple;
	bh=J8Mf3HYZaTmZYQFkYELALEytTws8uvz/goY09yFk2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVj5vX6b2zZsgkAbysV3ncj9kmZm39/TpOfOTaOE9phe25R6WqRqWn7gdMMMGKQAvh5vZSxeZbwaa+EqfuFBNwy71j1NeQPOcyUTyMqKSw04Nej2Dq+aVUp6PbNJjX/MzsSkkP9mM8rLd2X2j4BTSmMGMtRkh++ljIS8/wcYvC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPmbjGvj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPmbjGvj"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1642851a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 18:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789350353; x=1789955153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=oPmbjGvjZIWSY1Y8ESOZjbNHZG3ihC8JLqbxdeKQSgUhFu1ip3egUqTHrpyK2tLMiZ
         q5tZgNqSCrep2s/AvAzPapmIkLFAE0YUgym89hpZDewRku7fjv8pOnre5rO9klkfD2dm
         cVsGvaDxT+RjNqAW+vyFf8L9+lDn+DRXVVB5JWnxUQM/gzFurz85WzGdPjm34p6cOSyt
         cNd+ywHMzoYLqalMyvrB3JLi12QRaC3EwKXSGkqe7KpIVu9zO6tF5Lzn88g2xHXTKH9S
         CfJ8K6tyOuk3j1x/yGdv6Ow4cVK5A3xof+0JV3qKTPkOKSAShsKLj01M2MY6yZ1nVzK0
         U1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789350353; x=1789955153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGK4SZ365cD9EYRGUuPJEEEIN0V6+rF/hbiJa0/JQok=;
        b=ABS/Dv/OUGwVG9H+xa6W2gZd0zfgLir/jl8+wMkQbpnKfi4++H3G7pVyyTpOZ7NdjA
         J8owZWVNYeWLtGPdUFqLKyqKb/Ei3CFmkupnYzZy8sRX4UMM7+CyXjahg9NohZcOvMPM
         y524tzKXoPA+IaPLakmeODvNOpEowsK9jMihKUbSH8YR7BYRwv+Nmghvx84g685y+ISt
         KOJhNOQf7jkl4THWUadRPKOTY91BOQpW896148FnTroAPfeDmnWiIzJ2Ghy10PsPrMYy
         liBGh7ewiE286Pxs+Y9df2U+hajIdF3rKjCGFYBEPMLgtwHlP/Fp7XFgzQ2QDV9dIz2r
         GuLA==
X-Forwarded-Encrypted: i=1; AKwUvBxigaoOJyxeqdrqyfjs6ybL7AHGdm5jFmuvrHJopXJyYapsWX+FLFI7iLlokMCa/W+riVlWFDuPBF3neL+Bptk=@vger.kernel.org
X-Gm-Message-State: AFuF++mgJFll08OK73ZmWQVifAOYoM3PcBa6ee2wBdPbofSqH5C720HO
	PSaCABTGTvqm6VuJJDWUWRL2981y1nByTEN2V2Fd1URJSPRXefcqVakB
X-Gm-Gg: AYBFou3GLcCu/SRqXqj5uJ33wWtj3b1TWvdTFiHBVwmj0ZuYLOIDnU0ed9KwxPNay1N
	PfkWXC95Ld/q34T4E+tmfhwxQSlDlFStvhynDOfEfp+Sq15VbCxU+lVGb29/fH4MDhaPRWAbodS
	rvIKQ+kYYENMGDt6BSMrqStYB4SbSdMBv1MgF1oVJOt6ZoaZlpSXx9O/thAHjAXJ8oR9AsDLi1f
	My3X7VuB1sMlv5TAkMO8fO4zQ5DMd7DcYrfAWPvgSIYqosuVmrApp6UrwppcE6f7e7XHmbypKwS
	M4Z83fFYX1QnDSegB6M3sjoDm74yAfTFnPNocq2/Vhnq2T0GutbIDZD3iUs6jDM8hiLyjCAyg4o
	dIbyNDnzf94y9vj07xXBcXwyMkQZNwNoE4hxYplfOaXZGTOHL0Dr08BChQkIT9uSTdSIWiCiHh2
	uNhwnPJ5mJofqjEmYwR8WSIOB3PuXNi2G15B6AQysPVqjmqTfistFZ8XjBK6ukbzqEcsTvsyqR/
	akdtOpG2p0sC/mzejoPtg0oJJOVQn88n4V+jzX+1Pb2d+g=
X-Received: by 2002:a17:90b:5343:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39debf6b420mr1107499a91.4.1789350353561;
        Sun, 13 Sep 2026 18:45:53 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:fd07:4a24:951e:c85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm17513403a91.7.2026.09.13.18.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:45:52 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v5 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
Date: Mon, 14 Sep 2026 10:45:36 +0900
Message-ID: <20260914014539.5015-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914014539.5015-1-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
declares its target-netnsid as s32, but rt-addr.yaml has it as binary.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..17ead2203451 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -119,7 +119,7 @@ attribute-sets:
         type: u32
       -
         name: target-netnsid
-        type: binary
+        type: s32
       -
         name: proto
         type: u8
-- 
2.43.0


Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC7346E5E;
	Sat,  1 Aug 2026 00:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544230; cv=pass; b=WfibG+Zi6A8lbnqo2YP6BsKkepaqQZsOtypiUH6h1+tWsrcM7+9ocmk1A7UjgFVy/0y9KwyP37mKi19QVpYPSy+pAX40+TKSg18p032B1JEYVI9fwCnazSHEy4+hOQf67NnZrD5G5mOFjnmkG2KbXDfnE/5xRw+gTBOY3yKOc9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544230; c=relaxed/simple;
	bh=JWXxw3NIt7qXg9QGhg7Ca3toVvHnbpflD31sY3JSwpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kj3Wdo0eyPri7WcTcCFxc0X3k1UYRMibAZyOIkOmSTyfHXThbeFIZshplj5wDj499T2dinOIyaCthfi7EhnIk/cC3AhUmqcg/k2k/qCVu7lNYjr33pspuoTm3mdCgKjF0yQbnkdwLLRDmUFgm9gccZgOPi/H+8KNBaOEYX3Fmd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=UZPr+myC; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="UZPr+myC"
ARC-Seal: i=1; a=rsa-sha256; t=1785544214; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=azQc/Pg4b3qSu4YCgZwd062YKIogBicbYM/JNb8Zx/m3P8rf/4PPFYDt2McosdvkH7Vbw99AcjD2Ykgm67D0sJXjnGWgA7O7r+fwU3fuXUoRyCNlddWHuOpqqAea61YNXBsp3g6d4NZZAqBZarRwex2Yt+6zmKIE6zBzkCKX3fI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785544214; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JWXxw3NIt7qXg9QGhg7Ca3toVvHnbpflD31sY3JSwpM=; 
	b=lBUHAh8ij9NL0IGrN9P/uGdMQvodpVADIZsUVX00m10/wPCVj7CSfyQY5pCOnqemWAzwhfQAiY3zpbxCSBpgrsGaUISZasp/CjE9Yj8HWa7a85Z7l7M2jCDbEQH1aruFgd5IjyOimMIAHhc8sKwAqLzZuXTEZ48qGGEC3OS/A6E=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785544214;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JWXxw3NIt7qXg9QGhg7Ca3toVvHnbpflD31sY3JSwpM=;
	b=UZPr+myCbtRSXWFit0FS+m1b07YsbFqAz3QKkaZX/qAAFK7U9El+B4oOGgUUThG6
	tq/PNJhiogi+Js43sm6yTHB+oaBlzj2SFY+h0etMG0zQ6BY0iJ18WwEqvmiFOpzy89y
	gCe/n9A39mHLxKjo1E74UVwC1+CF/ePwGI4HKnVg=
Received: by mx.zoho.eu with SMTPS id 1785544212792437.3094937556949;
	Sat, 1 Aug 2026 02:30:12 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: xiexinet@gmail.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 3/3] selftests: net: hsr: add shared-mutation regression test
Date: Sat,  1 Aug 2026 03:29:58 +0300
Message-ID: <20260801002958.241367-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728143604.26-4-xiexinet@gmail.com>
References: <20260728143604.26-4-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The test covers both classes: the PRP LAN-ID race under a netem delay on
one slave, and the HSR RedBox source-MAC alias with a tagged multicast on
a slave. The capability probes (tc, python3, sch_netem, HSR/PRP support)
exit ksft_skip and propagate that status, while real failures exit 1. The
capture filters keying on destination, post-strip EtherType and payload
while leaving the asserted source MAC unfiltered look correct.

Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>

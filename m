Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15B45A2A4;
	Fri, 31 Jul 2026 23:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542378; cv=pass; b=O9Pojydr31gfQQQXyDM9gV6rrbOCfO6tBAZgQ989z7GYUpAjoUOyaDtc+KZcoWn/7R1hyK3/X3ANYyla6hjPqfrosECJp5yuQ/14F/StDXHb9xLvuxZmQu4aRBUBEM30qJjq9ps6bUMWYhqd3LrglTrTwWKf4xgA3loJKM3e8as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542378; c=relaxed/simple;
	bh=VPHQbDALnYKS7N43+ET9wHLrmRaPdi+7heTTk9VLHg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfKr+djkS9vaVXQLUhLlNLwh4lMWjM7pYP8QDHj7vF2lBFIPE0IzIDYtsKb/o4gy/OX0TMoqd2G42xARE3XN1Qa+LgTr9g0Di37LX4UhLYAV6VgwWq0LhnCdyzLJyBCZVVs59PBGL4w1HSVAUzsAmLjl6njT1bjLSOlFMKDKQ2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=DZ91gz7Y; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="DZ91gz7Y"
ARC-Seal: i=1; a=rsa-sha256; t=1785542362; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=GinOe8bML+u28wYVUfXzt1t0lzzk1GD/9HeeqLYmwaKjfvD1WplNilP5t07ia1cxHsy5IGLFk+6m0qlEop47wpascpsSn+tf2jss0yjHPyutZjLui0yqz2jcqAYC6fYcLI96QB10QoSC9EyI4G9SHmlA4vqXiHJR2IhzYfvgka8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785542362; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VPHQbDALnYKS7N43+ET9wHLrmRaPdi+7heTTk9VLHg8=; 
	b=XU48SUooZiDoWBhFTZqNAhAZfDu5uMGpT9TId42YOLCINTpBtW3fennSd5nfkYYc5rcsMnOSTiLy6VsVxFg591rFF+u1oTaR5OG4y++BL5JGenKGWPJ4ENoEn/Cf4n5di46H6Vs4/I63Xd9AEtLuVBouj1mOaQKNV+Hng6isojI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785542362;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VPHQbDALnYKS7N43+ET9wHLrmRaPdi+7heTTk9VLHg8=;
	b=DZ91gz7Yxziam/IdXdCoRdyxvAEdliJKJ1I26mfHadrPkV2uakiOF1QMGeNdJPJo
	KsdkqPVXaELHt2N2kUyU/O3fn5OH79H8DORUH7n0tX+IueMuy+7TmtNrJTL+aSoE+hY
	JhgJnTo6wcra/b8urFHPXgOKYv6G9OaK6UUEqlC8=
Received: by mx.zoho.eu with SMTPS id 1785542359399426.66247028501107;
	Sat, 1 Aug 2026 01:59:19 +0200 (CEST)
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
Subject: Re: [PATCH net v3 4/4] selftests: net: hsr: add GRO super-packet forwarding test
Date: Sat,  1 Aug 2026 02:59:07 +0300
Message-ID: <20260731235907.204522-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731090224.18-5-xiexinet@gmail.com>
References: <20260731090224.18-5-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I ran this under virtme-ng (QEMU/KVM). It passes on the patched kernel:
the SAN TX frame-size average is around 41 kB, well over the 2048 byte
threshold, both DUT LAN legs average around 1497 bytes, under the 1514
byte guard, and it reports success. On an unpatched kernel it correctly
fails, where oversized HSR-tagged frames reach the LAN legs, so the test
discriminates the fix. The topology setup and the counter delta
thresholds look sound.

Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>

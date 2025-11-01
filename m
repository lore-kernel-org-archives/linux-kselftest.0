Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC3C3002B4
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Nov 2025 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762025201; cv=none; b=IzQmgBlPR5qygL6SYlFJ5mfeSYs/AP47Zbpp068ZTd45vcRBlqjHrcjqMSiCoFR6QsfPGmkuJbJ5oddtL1Vq6L7AuD2pXYtUR9/VRBssDp3ubT96byCDpK23VBks4CAnt36Y92rabAxhJjCzUKGjiQxWCnGon1jhHsDzquHSrhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762025201; c=relaxed/simple;
	bh=OlbjrUqrFESJO6tdOLRzQodCmGvYwxCCXLefB7mntyU=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=FrDUV6jwrKBTqPb8QcvLhEZmvArJU4s/2Uqbb5kw4I9/ihO9eWnlbfgAVMyuIzL+QTGHutjv22tSeIl00YwTE1ZcjrnxYmzRc2u95sHELySj/133AYHcFgNx05z6b7hRjesIJVnClvuPTAdf0SCiuwZw+bJogT+abgt53puXmwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net; spf=pass smtp.mailfrom=msa.hinet.net; dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b=IKejDWX7; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msa.hinet.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=msa.hinet.net header.i=@msa.hinet.net header.b="IKejDWX7"
Received: from cmsr1.hinet.net ([10.199.216.80])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A1JQVmo701383
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-kselftest@vger.kernel.org>; Sun, 2 Nov 2025 03:26:37 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
	s=default; t=1762025197; bh=AYxpddjpKrH3U1is927Vx5cemaI=;
	h=From:To:Subject:Date;
	b=IKejDWX7vYtCT9u+3xLRpzCo9avWj8GgkAtM6YxU7bhPDSSU2dIcoGmPnNKNmFJnF
	 3dGs7Ew0cL/lXKyhOL5f8Bbh79tqIdIEx+CAZP1xI6oP4w3cJ/cIVyNEkgBIqOT4xU
	 NBpvbV+iWhZM8eFG7TNWI7JaZDm9RiuxO0yJ/VM8=
Received: from [127.0.0.1] (111-242-201-198.dynamic-ip.hinet.net [111.242.201.198])
	by cmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A1JJOZs211737
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-kselftest@vger.kernel.org>; Sun, 2 Nov 2025 03:22:33 +0800
From: Procurement 05471 <Linux-kselftest@msa.hinet.net>
To: linux-kselftest@vger.kernel.org
Reply-To: Procurement <purchase@pathnsithu.com>
Subject: =?UTF-8?B?TkVXIFBPIDgzMTk5IFNhdHVyZGF5LCBOb3ZlbWJlciAxLCAyMDI1IGF0IDA4OjIyOjMyIFBN?=
Message-ID: <7705f6a7-84a1-2f3a-e624-e2d42196860f@msa.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Sat, 01 Nov 2025 19:22:33 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=DN4s4DNb c=1 sm=1 tr=0 ts=69065dfa
	a=cO7HC7VeERx3kDFW2GBoLg==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
	a=u3P4PbDkA_gY_gC8D5cA:9 a=QEXdDO2ut3YA:10

Hi Linux-kselftest,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: October

Thanks!

Danny Peddinti

PathnSitu Trading

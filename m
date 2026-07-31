Received: from sender-of-o57.zoho.eu (sender-of-o57.zoho.eu [136.143.169.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389F53546E2;
	Fri, 31 Jul 2026 23:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542366; cv=pass; b=SU4dz6xI4tZWVTgW+Yf8ydnkx939ei8QIQIkQpgscapUzRqxB6Q+usv+FfSGm89jjGHDTX4AX0E1pcbfdZ0i4bvHlPDDnjcRxmbr1T37GqDVzUy3/RhKjXj1+GGPWAug1g6anFKnC+IFTnXoWvS6CFD5uTU6UNoZoEkwNWChhYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542366; c=relaxed/simple;
	bh=x+kxuwMo9ZH+2HxaTzJDO4T7QZgt2TjK2WGgnV/nW50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pyS0P8zlX78d+PKOz2xz2SDbHd64hj4/86J44ZJpkhPJxPdgGYCmXUze1gpiBnrenxZ6W+8AUkRI9lfQJlEKfIpRZXpkc2wQboAYAYgnTeKobYobbFPZmuyVg+Rn2yZqCay6ZNH0460EBz3p9HZqTlU5KfO1YAC8dpw7EXwQ6FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=GQAqhgEX; arc=pass smtp.client-ip=136.143.169.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="GQAqhgEX"
ARC-Seal: i=1; a=rsa-sha256; t=1785542349; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=EtCjMNlBmuwVJWJ4oxpsoRCSGXo494eQtm4n8e1N84SvSIKH497AHmOXrKrfyS3beCNfEYEAwIYFcOHdva7XBFKhCTbRQgHzrYYq15JEvS3mlKGAvUsnayAjYmBPC70ORGXOy1BXYuQwKYFsFIenwmDOHaTSBUTm+mkZ2J9MOfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785542349; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x+kxuwMo9ZH+2HxaTzJDO4T7QZgt2TjK2WGgnV/nW50=; 
	b=V69mcOW+8wa8tzSAhfaO6OdeqilmZqXFphiiHY71fkat9lOWCrw49DTkHuk12ui7GPa50HsgdxBzWh/sghntW8yKMYS1xtr0CHBLJpque7TWy4cqb+jwR0lUCfj4ij5gxUQh0gTfyYY1wYb4RJelhxu7/nE4VgykAXetrdMUmi0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785542349;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=x+kxuwMo9ZH+2HxaTzJDO4T7QZgt2TjK2WGgnV/nW50=;
	b=GQAqhgEXImN2moAyFv90AEN4FVFmhB04I3W3XQ4pknRya9LpUxyyzZAA+WxJLUEi
	H7HKpHX4Gnxh59ibXqyV1PleMCHvwgAEAPgbQ0YugRDvYHbb69736uFHl5AUaM60BjK
	IdHssbqjwutvEJzYhXxeql8+zlCImkmOAcsVwUi4=
Received: by mx.zoho.eu with SMTPS id 17855423472151022.1033976651895;
	Sat, 1 Aug 2026 01:59:07 +0200 (CEST)
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
Subject: Re: [PATCH net v3 3/4] net: hsr: unfold GSO super-packets at the forward entry
Date: Sat,  1 Aug 2026 02:58:52 +0300
Message-ID: <20260731235852.204486-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731090224.18-4-xiexinet@gmail.com>
References: <20260731090224.18-4-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The __skb_gso_segment() dispatch and the consume_skb() and kfree_skb()
paths look correct: the original skb is freed on success and the segment
list is freed on error, with no double free. The port type gate keeps LAN
and tagged aggregates out of software segmentation.

Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>

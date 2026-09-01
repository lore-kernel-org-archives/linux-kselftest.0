Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403B413781;
	Tue,  1 Sep 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274845; cv=none; b=Ha9qVVuxlzPh46GriCrnEl+WRPlFM0Ha8cc723k8NvoebhQ8k0iTN7pbgtsdidhxtXgpbdZqfrMyX7cQZuy+GNzyA2tsKDom1h5Ujq7alk9lC3YgfKKqfUqN1+8nIBN3k4y7vtSLozouFlg8Dq7xHuq5MFZ7I8NLDIJ2zGpZs1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274845; c=relaxed/simple;
	bh=ROFHdh5YcxFRur32+u++7A9cnHI72YhPCUV519Syh7k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qr0ZYnLvk2q1n0X1dRk1SPSmxr8H/jM7dHSF6MMOgn4B0irebHLIGXAkk3u8AV0GeFBI/vI99SRJOW2T90ZDfvKQAVwHpkOPD9+i9vTy96Eqz4IBO10I+5IwZnXgI65hPotVueOswFGdW8bryJE1vTIA9chuw+tVx3Rwz0iyImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=ofIC+JK2; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="ofIC+JK2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ROFHdh5YcxFRur32+u++7A9cnHI72YhPCUV519Syh7k=;
	t=1788274842; x=1789484442; b=ofIC+JK2qVx1CYuElHaHRQd83iWfzKP4x1hyuATLyd/qhjc
	MRwTdOiJgJVmGCPbMTwA3mIGN96gqDxJI3Z9FBkJjb+RAo/rkHqJ1yQSrnW/EHkqQCkSFlyHGJ29i
	5wWbJlJr0F4TIv+Uvv8AiyTf8T0dXhV7297o9qYAedpOMsD1MQO7puSKByLWlogDd8zZtxT0WoAkn
	Est7cvjG/62x5pSuiWzPLgIXK+EX/iJ/QUSZ6kks0v1MqpCrzfaZHAQfvIyhm0GblpBSt2WXgKxYa
	VD5nfjNmNhWqqYUzBurI9Ubx+YyGGv8f9ZkzlIUAavvctQXFsXGOuVSvLUFh1cww==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x1PTm-000000062mY-3a8R;
	Tue, 01 Sep 2026 16:28:51 +0200
Message-ID: <40e95edb8dafd88fd13c3003c0e76df6a2f124d9.camel@sipsolutions.net>
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
From: Johannes Berg <johannes@sipsolutions.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Hajime Tazaki
	 <thehajime@gmail.com>
Cc: david@kernel.org, linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, 
	akpm@linux-foundation.org, luto@amacapital.net, brendan.jackman@linux.dev, 
	liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, broonie@kernel.org, 
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, 
	geert@linux-m68k.org, daniel@thingy.jp
Date: Tue, 01 Sep 2026 16:28:49 +0200
In-Reply-To: <apAgQJ5p8LEDj1c5@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
	 <f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
	 <ao2Tl9CLL7WjHYun@gremlin>
	 <bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
	 <ao2l9Ao7BQI6uRKC@gremlin> <m2y0dsuf1d.wl-thehajime@gmail.com>
	 <ao_541nBaa3SJS9F@gremlin> <m2v78wueir.wl-thehajime@gmail.com>
	 <apAgQJ5p8LEDj1c5@gremlin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2026-08-27 at 12:32 +0100, Lorenzo Stoakes (ARM) wrote:
>=20
> Ah ok cool, thanks! Is that headed to 7.3 or more like 7.4?

Seems everyone was on vacation (I just got back) so I believe it missed
7.3 since -rc1 is just out.

I hope to have enough time in this development period to the merge
window to figure out all of these things and get stuff merged - UM
wasn't on my priority list with all the (LLM) security(-ish) stuff going
on in wireless.

johannes

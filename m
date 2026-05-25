Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE6F1EF09B;
	Mon, 25 May 2026 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779726464; cv=none; b=ImVPSB78a1vCZNpOF/v/mD3it04w+loq8kwDC86M8nnHeFYnlg1B8RQkqaee91i4Mzt5gZRW5eME1JIowgYFAvzfNUnMgKlF/l2QyaAUpQvKBrt3PshP6yg/5H+B8FXfySK6cntQYG8EkVAAb6SNo9o0v75lxH5EpYoGW6/sC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779726464; c=relaxed/simple;
	bh=KSd7EgfBLSZw8lKZ0OyBCIjrzlTmnF/6G7Z1ULdfjYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ikSDbWIeIb8VTEN/Ms4NuZMWI1bk0V9a1yGtDNchackGxlrwBvycOOzA4cTIlGiM2FZ9GHuAwOdTO8AyUHYNXojHAqVAtDUTu6RmMhYbbW9Vm5cz4h4BVWcTgbALgVjIUtyRpmVQpGud6l7Vn1OdJtLYyFN7a/QBMCHxeGpePds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDqfQFCb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDqfQFCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A325C1F000E9;
	Mon, 25 May 2026 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779726463;
	bh=HsdW9LaIbycHjvJhgWJNxPtg5fqLkG+dKkTc85kX3Yc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fDqfQFCb+eYFk9xywS6U4h2pRlFR0jCbXLZUn6U4B4boj4uEg4X+4Fw08pozOuqAm
	 5uMrvrvD7eSQZgh715hfz8YP22Ed6d8DdlB8VArKNPEeCWBK1+l+XNrhxxMwVbWgE2
	 AYwYlcPS7UhlgWlXE3dM/JcMa5rJ4bw1SG7eEybeuQiwPY5xZV7xNo/dOiX3MmhOUV
	 1W4FzU0kU2rlKRdhiifFG8Z7USHLqq3jxqyJe5KWiYkfBPbWMBKRxZiKdW1oiqbdy2
	 KI4ojdsWS848YFWYatTjKp+lVhO36l5hEUI3uLlB5k8Sp0vN5CeYhgfRc0+Gm5V/Sh
	 TVa5FYTXpNitw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v2 03/10] liveupdate: Extract
 luo_session_deserialize_one helper
In-Reply-To: <20260514222628.931312-4-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Thu, 14 May 2026 22:26:21 +0000")
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
	<20260514222628.931312-4-pasha.tatashin@soleen.com>
Date: Mon, 25 May 2026 18:27:39 +0200
Message-ID: <2vxzy0h75u9w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 14 2026, Pasha Tatashin wrote:

> Extract the logic for deserializing single entries for sessions into
> separate helper functions. In preparation to a linked-block
> serialization for sessions.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

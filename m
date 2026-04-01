Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E1B2264D3
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 19:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775073108; cv=none; b=Kg/OXzBI1fZfOpY/fWgty35D5D8FM7c70wpkCtLool62d/eCs+PbG0cnIftPSsSNVtKdb/Uwtyc6OHymacOyFMeCXSTA8H1vAppVaGnyNo0QCUEl8/gqBQN2inMxk5cvxaENZa6G2tURW0icef82vXhtEUr4mKAdIegzOgbnUxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775073108; c=relaxed/simple;
	bh=E8Azed7ISUS24ijtOSsG/12uKKFlLinleIrWaxRYAm8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=t3MFvRo1GL4cXPchFcri1LYjgJjygtu39bo4ux0n7qnpwSZmOcCGsrWoTFXTyGdlRzAtoCfbKEFz3IYBE8IUAycHgeJh96vmQQH59BIzz/xlHqUaUex5A0b5barJpaloKNuOXpHqPzrRZw14slKxVT6kqgTDq6pAzTXvTpdFnMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fk/anP7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fk/anP7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49526C4CEF7;
	Wed,  1 Apr 2026 19:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775073108;
	bh=E8Azed7ISUS24ijtOSsG/12uKKFlLinleIrWaxRYAm8=;
	h=Date:To:Cc:From:Subject:From;
	b=fk/anP7mlc3XC70WksFDN7Nj0i/jcq1GUjeZhZThIopKqwEefXUyEyXTnEiR1PDNH
	 YUbjGZ77BfWZdvd9+VKZdCxnS28CWyyADOLBxsaUTcCOMZOuC9PvNBNEmuvplUuWFB
	 qfzG9UsOkd9ClArEOJxWDJrkwkk4TaaMtrSQgrrvHNTVCrN5QeqmPL7mgUCkCIrMdu
	 LSZ7YTr7/+1/hu2itDcE5TBelfJCKeHDl8q630Gr5q0gecjKLtHRsp0YfLg6/CUjlA
	 rwZ6fOBfuIIh/X/zW/5A8urSItwfBNCy+tcjl7ZcFk3AOty+64hXJIwQrRIxtalA3s
	 vDF/hQw9B639g==
Message-ID: <d0dc7caa-052b-4d50-aeb8-60d3327d1130@kernel.org>
Date: Wed, 1 Apr 2026 13:51:30 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: shuah <shuah@kernel.org>, linux-kselftest@vger.kernel.org
From: Shuah <shuah@kernel.org>
Subject: Sashiko.dev for kselftest
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roman,

Please add linux-kselftest list to sashiko.dev for reviews.

There might be double coverage for patches cc'ed to lkml
and other lists such as mm, net, bpf etc. Hope that won't
cause problems.

thanks,
-- Shuah



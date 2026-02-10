Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B17478
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717246; cv=none; b=RKC4m8lzL8k1X5xOJ5Q/+310NTWT0/AFwg03MCPRY9jMUUaWBJvk0YR6rAhc/6e73QCpJMpP+lhC0dYkFw5jfyqHmjGUNuRp/vqEOUqmGl6mutDv7SwPTuV1WNAx6uaL+YXBg0+2IWjiQP8OcWnYABaEkSBPOxAegOj3BfQiCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717246; c=relaxed/simple;
	bh=i0w+JJnI8EQ1ANeeI6I1RLGGDxI7WbHm2A3p2XQTLJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ue1sKM8UeITI8o5YpeXHbPGBj8rfDzOoysmqIIMWpSbCCSr0Py3FLU5TEhtDMqGLnKcSz84vWev5SL4m5p8HSClgafPGI5IYaBPOwIsdKcXMB5Ww3Y81wXUxjzKN+y1jgdUsmL4fENWqkm9X6elcTLoA4/piRMZYATLWQGqzMgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cXOcBI2o; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cXOcBI2o"
Message-ID: <5c4bbbea-d68c-4089-b3aa-adb4b05696ba@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770717232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bY2w/gFpe4hqGmltQJxPswTFNUUVRovXPzch+Q2omm0=;
	b=cXOcBI2obVyz8/uVaDicrDq3MM8FcZNT6T+NqRAPva0UIEBCo1j0CYDU2l+540n7q0QyZR
	JImIJ6h/phJO6I2Cp6LHjhbxun0/+XEKSDl9jsYq6eEr7b9CsnfK8PTcIwYEFHcKNNGAX3
	sGPab92uevecxsto9+C1tCn69BFm6cY=
Date: Tue, 10 Feb 2026 17:53:07 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/1] smb/client: introduce KUnit test to check search
 result of smb2_error_map_table
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: bharathsm@microsoft.com, chenxiaosong@kylinos.cn, dhowells@redhat.com,
 linkinjeon@kernel.org, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-cifs@vger.kernel.org, pc@manguebit.org, ronniesahlberg@gmail.com,
 senozhatsky@chromium.org, smfrench@gmail.com, sprasad@microsoft.com,
 tom@talpey.com
References: <20260118091313.1988168-1-chenxiaosong.chenxiaosong@linux.dev>
 <20260210081040.4156383-1-geert@linux-m68k.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: ChenXiaoSong <chenxiaosong.chenxiaosong@linux.dev>
In-Reply-To: <20260210081040.4156383-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Geert,

Thank you for reviewing this patch.

The KUnit test cases are only executed when the CONFIG_SMB_KUNIT_TESTS 
is enabled.

Making it a separate test module would require exporting local variables 
and functions so that the test code can access them. However, exporting 
local variables and functions would likely make the code much uglier, as 
it would require adding "#if" conditionals into the production code to 
isolate the test code.

Geert, please let me know if you have a better idea.

I am also discussing this with the ext4 community, and we all hope to 
find a way to make the tests a separate module.

Thanks,
ChenXiaoSong <chenxiaosong@kylinos.cn>

On 2/10/26 4:10 PM, Geert Uytterhoeven wrote:
>   	Hi ChenXiaoSong,
> 
> Thanks for your patch, which is now commit 480afcb19b61385d
> ("smb/client: introduce KUnit test to check search result of
> smb2_error_map_table") in linus/master
> 
>> The KUnit test are executed when cifs.ko is loaded.
> This means the tests are_always_ executed when cifs.ko is loaded,
> which is different from how most other test modules work.
> Please make it a separate test module, so it can be loaded independently
> of the main cifs module.  That way people can enable all tests in
> production kernels, without affecting the system unless a test module
> is actually loaded.


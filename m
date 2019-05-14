From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 14 May 2019 17:28:05 -0600
Subject: [PATCH] selftests: drivers: Create .gitignore to include
 /dma-buf/udmabuf
In-Reply-To: <20190512050452.4720-1-skunberg.kelsey@gmail.com>
References: <20190512050452.4720-1-skunberg.kelsey@gmail.com>
Message-ID: <12ba7acd-6181-7925-5231-35b9dae4971f@linuxfoundation.org>

On 5/11/19 11:04 PM, Kelsey Skunberg wrote:
> Create /selftests/drivers/.gitignore which holds the following file name
> created after compiling:
> 

Thanks for the patch.

Ran into the same relative path WARN from checkpatch for the commit
log. Fixed it and applied.

thanks,
-- Shuah

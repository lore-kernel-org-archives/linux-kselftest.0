From: shuah@kernel.org (Shuah Khan)
Date: Wed, 12 Sep 2018 12:53:46 -0600
Subject: ion selftest compilation failed
In-Reply-To: <d81022fe-7fa6-2371-d6c2-057bb552d125@intel.com>
References: <d81022fe-7fa6-2371-d6c2-057bb552d125@intel.com>
Message-ID: <c37cbcfb-6a1c-faa3-7f93-d1529035fe24@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180912185346.2YUD9P_dx2FQjSS0rVKB061iFTS5bmTuwEOzcFPmBEU@z>

On 09/11/2018 11:29 AM, Alexey Skidanov wrote:
> Hi,
> 
> ION selftest compilation failed with the following error on my machine:
> 
> ionmap_test.c:12:27: fatal error: linux/dma-buf.h: No such file or directory
> 
> I have resolved it by exporting kernel headers for user space:
> 
> make headers_install INSTALL_HDR_PATH=/usr
> 
> Probably it should be part of the make file?
> 
> Tthanks,
> Alexey
> 

Hi Alexey,

Is this on the mainline or linux-next? Can you give me more details on how your
are compiling and code base etc.

thanks,
-- Shuah

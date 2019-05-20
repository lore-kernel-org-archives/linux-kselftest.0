From: wsa at the-dreams.de (Wolfram Sang)
Date: Mon, 20 May 2019 17:05:10 +0200
Subject: [PATCH 10/10] docs: fix broken documentation links
In-Reply-To: <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
 <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
Message-ID: <20190520150510.GA2606@kunai>

On Mon, May 20, 2019 at 11:47:39AM -0300, Mauro Carvalho Chehab wrote:
> Mostly due to x86 and acpi conversion, several documentation
> links are still pointing to the old file. Fix them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung at kernel.org>

Thanks, didn't notice that.

>  Documentation/i2c/instantiating-devices          |  2 +-

...

> diff --git a/Documentation/i2c/instantiating-devices b/Documentation/i2c/instantiating-devices
> index 0d85ac1935b7..5a3e2f331e8c 100644
> --- a/Documentation/i2c/instantiating-devices
> +++ b/Documentation/i2c/instantiating-devices
> @@ -85,7 +85,7 @@ Method 1c: Declare the I2C devices via ACPI
>  -------------------------------------------
>  
>  ACPI can also describe I2C devices. There is special documentation for this
> -which is currently located at Documentation/acpi/enumeration.txt.
> +which is currently located at Documentation/firmware-guide/acpi/enumeration.rst.
>  
>  
>  Method 2: Instantiate the devices explicitly

For this I2C part:

Reviewed-by: Wolfram Sang <wsa at the-dreams.de>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190520/2097c13a/attachment.sig>

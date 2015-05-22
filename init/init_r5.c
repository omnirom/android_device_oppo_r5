/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties()
{
    char buf[1] = "0";
    int fd = -1;
    int international = 0;

    fd = open("/proc/oppoVersion/operatorName", O_RDONLY);
    if (fd >=0) {
        if (read(fd, buf, 1) == 1) {
            int op = atoi(buf);
            if (op == 5) {
                international = 1;
            }
        }
    }
    close(fd);

    ERROR("libinit_r5: international=%d\n", international);

    if(international) {
        property_set("ro.build.product", "R8106");
        property_set("ro.product.model", "R8106");
        property_set("ro.product.name", "R8106");
    } else {
        property_set("ro.build.product", "R8107");
        property_set("ro.product.model", "R8107");
        property_set("ro.product.name", "R8107");
    }
}

#if 0
int main(int argc, char** argv) {
    vendor_load_properties();
    return 0;
}
#endif

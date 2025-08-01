import { OrganizationData } from "modules/organization/resources/Organization";

export type VideoData = {
  id: number;
  name: string;
  header: string;
  organization: OrganizationData;
  createdTime: string;
  files: {
    theora?: string;
    largeThumb: string;
    webmMed?: string;
  };
};

export type VideoCategoryData = {
  id: number;
  name: string;
  desc: string;
  videocount: number;
};

export type VideoUploadTokenData = {
  uploadToken: string;
  uploadUrl: string;
};
